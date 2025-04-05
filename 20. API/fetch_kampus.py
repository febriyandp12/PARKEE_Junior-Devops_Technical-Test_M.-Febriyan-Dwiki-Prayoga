import pandas as pd
import json

# =============================
# 1. Baca data dari file JSON lokal
# =============================
json_file = "universities_raw.json"
print(f"📂 Membaca data dari file: {json_file}")
with open(json_file, "r", encoding="utf-8") as f:
    data = json.load(f)
print(f"✅ Jumlah universitas ditemukan: {len(data)}")

# =============================
# 2. Konversi ke DataFrame
# =============================
df = pd.DataFrame(data)
print(f"\nKolom tersedia: {df.columns.tolist()}")
print(f"Jumlah baris: {len(df)}")

# =============================
# 3. Filter kolom penting
# =============================
selected_cols = ["name", "web_pages", "country", "domains", "state-province"]
df = df[selected_cols]
df.columns = ["Name", "Web pages", "Country", "Domains", "State Province"]

print("\n📊 Data contoh:")
print(df.head(3))

# =============================
# 4. Filter yang memiliki State Province
# =============================
before = len(df)
df_filtered = df.dropna(subset=["State Province"])
after = len(df_filtered)
print(f"\n🧹 Filter State Province:")
print(f"Sebelum: {before} → Sesudah: {after}")
print(df_filtered.head(3))

# =============================
# 5. Simpan hasil ke CSV
# =============================
df_filtered.to_csv("universities_filtered.csv", index=False)
print("\n✅ Selesai! File 'universities_filtered.csv' berhasil dibuat.")