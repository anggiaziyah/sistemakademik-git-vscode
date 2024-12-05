import 'Mahasiswa.dart';
import 'MataKuliah.dart';

class KRS {
  final Mahasiswa mahasiswa;
  final List<MataKuliah> daftarMataKuliah;

  KRS({required this.mahasiswa, required this.daftarMataKuliah});
}
