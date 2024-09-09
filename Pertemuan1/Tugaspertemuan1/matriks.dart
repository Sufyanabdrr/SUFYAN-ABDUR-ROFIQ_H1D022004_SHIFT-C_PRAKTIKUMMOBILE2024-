// Definisi class Matrix untuk melakukan operasi matriks
class Matrix {
  // Properti matriks yang disimpan dalam bentuk List 2D
  List<List<int>> matrix;

  // Constructor untuk inisialisasi matriks
  Matrix(this.matrix);

  // Fungsi untuk menampilkan isi matriks
  void display() {
    for (var row in matrix) {
      print(row);
    }
  }

  // Fungsi untuk penjumlahan dua matriks
  Matrix add(Matrix other) {
    if (matrix.length != other.matrix.length ||
        matrix[0].length != other.matrix[0].length) {
      throw Exception(
          'Ukuran matriks tidak sama, penjumlahan tidak dapat dilakukan.');
    }

    List<List<int>> result = List.generate(
        matrix.length,
        (i) => List.generate(
            matrix[0].length, (j) => matrix[i][j] + other.matrix[i][j]));

    return Matrix(result);
  }

  // Fungsi untuk perkalian dua matriks
  Matrix multiply(Matrix other) {
    if (matrix[0].length != other.matrix.length) {
      throw Exception('Ukuran matriks tidak kompatibel untuk perkalian.');
    }

    int rows = matrix.length;
    int cols = other.matrix[0].length;
    int n = matrix[0].length;

    // Matriks hasil perkalian
    List<List<int>> result =
        List.generate(rows, (i) => List.generate(cols, (j) => 0));

    // Melakukan perkalian matriks
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        for (int k = 0; k < n; k++) {
          result[i][j] += matrix[i][k] * other.matrix[k][j];
        }
      }
    }

    return Matrix(result);
  }
}

// Fungsi utama untuk menjalankan program
void main() {
  // Inisialisasi dua matriks
  List<List<int>> matrix1Data = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  List<List<int>> matrix2Data = [
    [9, 8, 7],
    [6, 5, 4],
    [3, 2, 1]
  ];

  // Membuat objek matriks
  Matrix matrix1 = Matrix(matrix1Data);
  Matrix matrix2 = Matrix(matrix2Data);

  // Menampilkan matriks pertama
  print('Matriks Pertama:');
  matrix1.display();

  // Menampilkan matriks kedua
  print('\nMatriks Kedua:');
  matrix2.display();

  // Melakukan penjumlahan matriks
  Matrix sumMatrix = matrix1.add(matrix2);
  print('\nHasil Penjumlahan Matriks:');
  sumMatrix.display();

  // Melakukan perkalian matriks
  Matrix multipliedMatrix = matrix1.multiply(matrix2);
  print('\nHasil Perkalian Matriks:');
  multipliedMatrix.display();
}
