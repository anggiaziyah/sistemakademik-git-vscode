import '../lib/Mahasiswa.dart';
import '../lib/MataKuliah.dart';
import '../lib/KRS.dart';
import '../lib/Nilai.dart';

List<Nilai> inputNilai(List<MataKuliah> mataKuliah, List<double> nilai) {
  List<Nilai> daftarNilai = [];
  for (int i = 0; i < mataKuliah.length; i++) {
    daftarNilai.add(Nilai(mataKuliah: mataKuliah[i], nilai: nilai[i]));
  }
  return daftarNilai;
}

double hitungIPK(List<Nilai> daftarNilai) {
  if (daftarNilai.isEmpty) return 0.0;

  double totalNilai = 0;
  int totalSKS = 0;

  for (var nilai in daftarNilai) {
    totalNilai += nilai.nilai * nilai.mataKuliah.sks;
    totalSKS += nilai.mataKuliah.sks;
  }
  return totalNilai / totalSKS;
}

String cetakKRS(KRS krs) {
  String hasil = "KRS Mahasiswa: ${krs.mahasiswa.nama}\n";
  hasil += "NIM: ${krs.mahasiswa.nim}, Semester: ${krs.mahasiswa.semester}\n";
  hasil += "Daftar Mata Kuliah:\n";
  for (var matkul in krs.daftarMataKuliah) {
    hasil += "${matkul.kode} - ${matkul.nama} (${matkul.sks} SKS)\n";
  }
  return hasil;
}

String cetakTranskrip(List<Nilai> daftarNilai) {
  String hasil = "Transkrip Nilai:\n";
  for (var nilai in daftarNilai) {
    hasil += "${nilai.mataKuliah.kode} - ${nilai.mataKuliah.nama}: ${nilai.nilai}\n";
  }
  return hasil;
}

void main() {
  // Data Mahasiswa
  Mahasiswa mahasiswa = Mahasiswa(nim: "230103091", nama: "Anggi Aziyah Kusumaningrum", semester: 3);

  // Data Mata Kuliah
  List<MataKuliah> mataKuliah = [
    MataKuliah(kode: "MK001", nama: "Pemrograman Berorientasi Objek", sks: 3),
    MataKuliah(kode: "MK002", nama: "Matematika Diskrit", sks: 2),
    MataKuliah(kode: "MK003", nama: "Statistika", sks: 2),
  ];

  // KRS
  KRS krs = KRS(mahasiswa: mahasiswa, daftarMataKuliah: mataKuliah);

  // Input Nilai
  List<double> nilaiMahasiswa = [3.5, 4.0, 3.0];
  List<Nilai> daftarNilai = inputNilai(mataKuliah, nilaiMahasiswa);

  // Cetak KRS
  print(cetakKRS(krs));

  // Cetak Transkrip Nilai
  print(cetakTranskrip(daftarNilai));

  // Hitung dan Cetak IPK
  double ipk = hitungIPK(daftarNilai);
  print("IPK Mahasiswa: ${ipk.toStringAsFixed(2)}");
}
