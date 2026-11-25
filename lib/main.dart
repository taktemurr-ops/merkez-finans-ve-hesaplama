import 'package:finans_motoru/finans_motoru.dart';
import 'package:flutter/material.dart';
import 'package:studio_core/apps/apps.dart';
import 'package:uyg_abonelik_takibi/uyg_abonelik_takibi.dart';
import 'package:uyg_birikim_hedefi/uyg_birikim_hedefi.dart';
import 'package:uyg_birim_fiyat_karsilastirma/uyg_birim_fiyat_karsilastirma.dart';
import 'package:uyg_borc_takibi/uyg_borc_takibi.dart';
import 'package:uyg_butce_ve_harcama_takibi/uyg_butce_ve_harcama_takibi.dart';
import 'package:uyg_enflasyon_hesaplayici/uyg_enflasyon_hesaplayici.dart';
import 'package:uyg_faiz_ve_birikim_hesaplayici/uyg_faiz_ve_birikim_hesaplayici.dart';
import 'package:uyg_fatura_hatirlatici/uyg_fatura_hatirlatici.dart';
import 'package:uyg_gelir_vergisi_hesaplayici/uyg_gelir_vergisi_hesaplayici.dart';
import 'package:uyg_harclik_takibi/uyg_harclik_takibi.dart';
import 'package:uyg_hesap_bolusme_ve_bahsis/uyg_hesap_bolusme_ve_bahsis.dart';
import 'package:uyg_indirim_ve_kdv_hesaplayici/uyg_indirim_ve_kdv_hesaplayici.dart';
import 'package:uyg_kira_artis_hesaplayici/uyg_kira_artis_hesaplayici.dart';
import 'package:uyg_kredi_hesaplayici/uyg_kredi_hesaplayici.dart';
import 'package:uyg_kredi_karti_borc_planlayici/uyg_kredi_karti_borc_planlayici.dart';
import 'package:uyg_taksit_hesaplayici/uyg_taksit_hesaplayici.dart';
import 'package:uyg_zekat_hesaplayici/uyg_zekat_hesaplayici.dart';

/// Finans ve Hesaplama: 17 çevrimdışı araç tek uygulamada. Her aracın verisi
/// ayrı saklanır; reklam yalnızca bir araçtan çıkarken ve en az 3 dakika
/// arayla gösterilir.
final hubConfig = AppHubConfig(
  hubId: 'merkez-finans-ve-hesaplama',
  title: finansHubTitle,
  tagline: finansHubTagline,
  icon: Icons.account_balance_wallet_rounded,
  style: finansHubStyle,
  categories: finansCategories,
  tools: [
    butceVeHarcamaTakibiTool,
    krediHesaplayiciTool,
    faizVeBirikimHesaplayiciTool,
    indirimVeKdvHesaplayiciTool,
    hesapBolusmeVeBahsisTool,
    borcTakibiTool,
    abonelikTakibiTool,
    faturaHatirlaticiTool,
    birikimHedefiTool,
    harclikTakibiTool,
    birimFiyatKarsilastirmaTool,
    taksitHesaplayiciTool,
    krediKartiBorcPlanlayiciTool,
    kiraArtisHesaplayiciTool,
    enflasyonHesaplayiciTool,
    gelirVergisiHesaplayiciTool,
    zekatHesaplayiciTool,
  ],
  featured: finansFeatured,
  privacyUrl: 'https://github.com/taktemurr-ops/merkez-finans-ve-hesaplama/blob/main/PRIVACY.md',
);

void main() => bootstrapAppHub(hubConfig);
