# QISNet 2027 - download organizer / TPC headshots into assets/img/people/
# Run from the repo root in PowerShell:   .\download_photos.ps1
# Each image overwrites the placeholder avatar of the same name. If a primary URL fails, the alternate is tried.
$ErrorActionPreference = "Continue"
$dir = Join-Path $PSScriptRoot "assets\img\people"
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$photos = @(
  @{ slug = "shuhui-yang"; name = "Shuhui Yang"; urls = @("https://www.pnw.edu/wp-content/uploads/2020/01/Yang-Shuhui.jpg", "https://www.pnw.edu/wp-content/uploads/2020/01/Shuhui_Grace_Yang_BH4_5389-900x600.jpg") },
  @{ slug = "yunhe-feng"; name = "Yunhe Feng"; urls = @("https://yunhefeng.me/material/ID_photo.jpg", "https://engineering.unt.edu/people/images/yunhe_feng.jpg") },
  @{ slug = "celso-villas-boas"; name = "Celso Jorge Villas-Boas"; urls = @("https://www.ppgf.ufscar.br/en/assets/imagens/docentes/celso-jorge-villas-boas.jpg") },
  @{ slug = "shengwang-du"; name = "Shengwang Du"; urls = @("https://www.physics.purdue.edu/people/images/shengwangdu.jpg") },
  @{ slug = "lei-fan"; name = "Lei Fan"; urls = @("https://www.et.uh.edu/sites/et/files/images/faculty/fanlei.jpg", "https://www.egr.uh.edu/sites/ccoe.egr.uh.edu/files/images/news/2026/lei-fan.png") },
  @{ slug = "bo-fang"; name = "Bo Fang"; urls = @("https://cdn.prod.web.uta.edu/-/media/project/website/engineering/faculty-headshots/large_portrait/bo-fang.jpg?revision=77a7859b-f093-4477-af31-d834ffa0b125", "https://flyree.github.io/images/IMG_1738.jpeg") },
  @{ slug = "qiang-guan"; name = "Qiang Guan"; urls = @("https://www.guans.cs.kent.edu/images/teampic/qguan.png", "https://www-s3-live.kent.edu/s3fs-root/s3fs-public/styles/profile_photo_internal/public/GuanQiang-pic%20%28457x640%29.jpg") },
  @{ slug = "shafkat-islam"; name = "Shafkat Islam"; urls = @("https://www.pnw.edu/wp-content/uploads/2025/09/ShafkatIslam.jpg", "https://www.pnw.edu/wp-content/uploads/2025/11/IslamShafkat5P7A7323-500x625.jpg") },
  @{ slug = "kishor-kapale"; name = "Kishor Kapale"; urls = @("https://www.wiu.edu/cas/physics/images/faculty/KapaleKishor250w.jpg") },
  @{ slug = "tae-hoon-kim"; name = "Tae-Hoon Kim"; urls = @("https://www.pnw.edu/wp-content/uploads/2020/01/Tae-Hoon-Kim-2015-web-1.jpg") },
  @{ slug = "david-liu"; name = "David Q. Liu"; urls = @("https://www.pfw.edu/sites/default/files/images-2024/11/20241014-Liu-David-JW-001.jpg", "https://www.cerias.purdue.edu/assets/images/people/Liu_David_300x300.png") },
  @{ slug = "antonio-paes"; name = "Antonio Padua Paes"; urls = @("https://jindal.utdallas.edu/jindal/files/2025/10/antonio_paes.png", "https://provost.utdallas.edu/files/2025/08/Antonio_Paes_2_new.jpg") },
  @{ slug = "runzhou-tao"; name = "Runzhou Tao"; urls = @("https://www.cs.umd.edu/sites/default/files/images/userpictures/photo_runzhou.jpg", "https://quics.umd.edu/static/fbbcb59de4639555f5983c4c4c838ae4/fec77/picture-787-1730726145.jpg") },
  @{ slug = "yu-wang"; name = "Yu Wang"; urls = @("https://cis.temple.edu/~yu/YWang.jpg", "https://cis.temple.edu/~yu/yuwang.jpg") }
)
foreach ($p in $photos) {
  $out = Join-Path $dir ($p.slug + ".jpg")
  $ok = $false
  foreach ($u in $p.urls) {
    try {
      Invoke-WebRequest -Uri $u -OutFile $out -UserAgent "Mozilla/5.0" -TimeoutSec 60
      if ((Get-Item $out).Length -gt 5000) { Write-Host ("OK   " + $p.name + "  <-  " + $u); $ok = $true; break }
    } catch { Write-Host ("warn " + $p.name + ": " + $u + " failed (" + $_.Exception.Message + ")") }
  }
  if (-not $ok) { Write-Host ("FAIL " + $p.name + " - please save a headshot manually as " + $out) -ForegroundColor Yellow }
}
Write-Host ""
Write-Host "Note: Shawn He Yuxun has no public individual headshot; add assets/img/people/shawn-he.jpg manually."
Write-Host "Images are saved with a .jpg name regardless of source format (PNG works fine in browsers)."
