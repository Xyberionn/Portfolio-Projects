import pandas as pd

def class_degistir(csv_dosya, hedef_dosya, eski_class, yeni_class):
    # CSV dosyasını oku
    veri = pd.read_csv(csv_dosya)

    # Belirli sütunu (class) değiştir
    veri['class'] = veri['class'].replace(eski_class, yeni_class)

    # Değiştirilmiş veriyi hedef dosyaya kaydet
    veri.to_csv(hedef_dosya, index=False)
    print(f"'{eski_class}' sınıfı, '{yeni_class}' ile değiştirildi ve {hedef_dosya} olarak kaydedildi.")

# Kullanım örneği
csv_dosya = 'path/to/your/file.csv'  # CSV dosyasının dosya yolu
hedef_dosya = 'path/to/output/modified_data.csv'  # Değiştirilmiş verinin kaydedileceği dosya yolu
eski_class = 'Glass'  # Değiştirilecek eski sınıf değeri
yeni_class = 'glass'  # Yeni sınıf değeri

class_degistir(csv_dosya, hedef_dosya, eski_class, yeni_class)
