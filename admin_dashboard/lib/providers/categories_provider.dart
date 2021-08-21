import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];

  getCategories() async {
    final response = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(response);
    this.categorias = [...categoriesResponse.categorias];
    print(this.categorias);
    notifyListeners();
  }

  Future<void> newCategory(String name) async {
    final data = {
      'nombre': name,
    };
    try {
      final json = await CafeApi.post('/categorias', data);
      final newCategory = Categoria.fromMap(json);
      categorias.add(newCategory);
      notifyListeners();
    } catch (e) {
      throw 'Error al crear categoria';
    }
  }

  Future<void> updateCategory(String id, String name) async {
    final data = {
      'nombre': name,
    };
    try {
      await CafeApi.put('/categorias/$id', data);

      for (int i = 0; i < this.categorias.length; i++) {
        if (this.categorias[i].id == id) {
          this.categorias[i].nombre = name;
          break;
        }
      }
      /*
      this.categorias = this.categorias.map(
        (category) {
          if (category.id != id) return;
          category.nombre = name;
          return category;
        },
      ).toList();
      */
      notifyListeners();
    } catch (e) {
      throw 'Error al actualiza categoría';
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await CafeApi.delete('/categorias/$id', {});
      this.categorias.removeWhere((c) => c.id == id);
      notifyListeners();
    } catch (e) {
      throw 'Error al eliminar categoría';
    }
  }
}
