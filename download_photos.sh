#!/usr/bin/env bash
# QISNet 2027 - download organizer / TPC headshots into assets/img/people/
# Run from the repo root:   bash download_photos.sh
# Each image overwrites the placeholder avatar of the same name. If a primary URL fails, the alternate is tried.
cd "$(dirname "$0")" && mkdir -p assets/img/people
fetch() {  # slug name url [alt_url]
  local slug="$1" name="$2"; shift 2
  for u in "$@"; do
    if curl -fsSL -A "Mozilla/5.0" --max-time 60 -o "assets/img/people/$slug.jpg" "$u" && [ "$(wc -c < "assets/img/people/$slug.jpg")" -gt 5000 ]; then
      echo "OK   $name  <-  $u"; return 0
    fi
  done
  echo "FAIL $name - please save a headshot manually as assets/img/people/$slug.jpg"; return 1
}
fetch "shuhui-yang" "Shuhui Yang" "https://www.pnw.edu/wp-content/uploads/2020/01/Yang-Shuhui.jpg" "https://www.pnw.edu/wp-content/uploads/2020/01/Shuhui_Grace_Yang_BH4_5389-900x600.jpg"
fetch "yunhe-feng" "Yunhe Feng" "https://yunhefeng.me/material/ID_photo.jpg" "https://engineering.unt.edu/people/images/yunhe_feng.jpg"
fetch "celso-villas-boas" "Celso Jorge Villas-Boas" "https://www.ppgf.ufscar.br/en/assets/imagens/docentes/celso-jorge-villas-boas.jpg"
fetch "shengwang-du" "Shengwang Du" "https://www.physics.purdue.edu/people/images/shengwangdu.jpg"
fetch "lei-fan" "Lei Fan" "https://www.et.uh.edu/sites/et/files/images/faculty/fanlei.jpg" "https://www.egr.uh.edu/sites/ccoe.egr.uh.edu/files/images/news/2026/lei-fan.png"
fetch "bo-fang" "Bo Fang" "https://cdn.prod.web.uta.edu/-/media/project/website/engineering/faculty-headshots/large_portrait/bo-fang.jpg?revision=77a7859b-f093-4477-af31-d834ffa0b125" "https://flyree.github.io/images/IMG_1738.jpeg"
fetch "qiang-guan" "Qiang Guan" "https://www.guans.cs.kent.edu/images/teampic/qguan.png" "https://www-s3-live.kent.edu/s3fs-root/s3fs-public/styles/profile_photo_internal/public/GuanQiang-pic%20%28457x640%29.jpg"
fetch "shafkat-islam" "Shafkat Islam" "https://www.pnw.edu/wp-content/uploads/2025/09/ShafkatIslam.jpg" "https://www.pnw.edu/wp-content/uploads/2025/11/IslamShafkat5P7A7323-500x625.jpg"
fetch "kishor-kapale" "Kishor Kapale" "https://www.wiu.edu/cas/physics/images/faculty/KapaleKishor250w.jpg"
fetch "tae-hoon-kim" "Tae-Hoon Kim" "https://www.pnw.edu/wp-content/uploads/2020/01/Tae-Hoon-Kim-2015-web-1.jpg"
fetch "david-liu" "David Q. Liu" "https://www.pfw.edu/sites/default/files/images-2024/11/20241014-Liu-David-JW-001.jpg" "https://www.cerias.purdue.edu/assets/images/people/Liu_David_300x300.png"
fetch "antonio-paes" "Antonio Padua Paes" "https://jindal.utdallas.edu/jindal/files/2025/10/antonio_paes.png" "https://provost.utdallas.edu/files/2025/08/Antonio_Paes_2_new.jpg"
fetch "runzhou-tao" "Runzhou Tao" "https://www.cs.umd.edu/sites/default/files/images/userpictures/photo_runzhou.jpg" "https://quics.umd.edu/static/fbbcb59de4639555f5983c4c4c838ae4/fec77/picture-787-1730726145.jpg"
fetch "yu-wang" "Yu Wang" "https://cis.temple.edu/~yu/YWang.jpg" "https://cis.temple.edu/~yu/yuwang.jpg"
echo
echo "Note: Shawn He Yuxun has no public individual headshot; add assets/img/people/shawn-he.jpg manually."
echo "Images are saved with a .jpg name regardless of source format (PNG works fine in browsers)."
