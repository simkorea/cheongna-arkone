-- ═══════════════════════════════════════════════════════════════
-- 명함용 현장 등록 — 청라 아크원 푸르지오 (slug: arkone)
-- ───────────────────────────────────────────────────────────────
-- Supabase 대시보드 → SQL Editor 에 붙여넣고 Run.
-- ※ Vercel 배포가 끝난 뒤에 돌린다. 이미지가 배포된 사이트 주소를
--    직접 참조하므로, 배포 전에는 이미지가 비어 보인다.
-- ※ Vercel 프로젝트 이름이 cheongna-arkone 이 아니면 아래 주소를
--    실제 주소로 바꾼 뒤 실행한다.
--
-- 다시 실행해도 안전하다(같은 slug 면 덮어쓴다).
-- ═══════════════════════════════════════════════════════════════

insert into public.card_sites
  (slug, name, headline, subhead, hero_url, specs, images, notice, address, site_url, published)
values (
  'arkone',
  '청라 아크원 푸르지오',
  '청라의 정점에서, 단 하나의 기준',
  '청라국제업무단지 · 지상 44층 · 1,855세대',
  'https://cheongna-arkone.vercel.app/images/ca/og-image.jpg',
  '[
    {
        "k": "공급위치",
        "v": "인천광역시 서해구 청라동 86-1번지"
    },
    {
        "k": "건축규모",
        "v": "지하 5층 ~ 지상 44층, 총 6개 동 (아파트 3개 동)"
    },
    {
        "k": "세대수",
        "v": "총 1,855세대 (아파트 868세대 / 오피스텔 987실)"
    },
    {
        "k": "주택형",
        "v": "전용 84㎡(A·B·C·D) · 103㎡(A·B)"
    },
    {
        "k": "시공사",
        "v": "㈜대우건설"
    },
    {
        "k": "사업주체",
        "v": "㈜청라스마트시티"
    },
    {
        "k": "분양가",
        "v": "분양가상한제 적용단지 · 동·층·향별 차등 (문의)"
    },
    {
        "k": "입주예정",
        "v": "2031년 예정"
    },
    {
        "k": "견본주택",
        "v": "인천광역시 서해구 청라동 87-1번지"
    },
    {
        "k": "홍보관",
        "v": "인천광역시 서해구 중봉대로586번길 19 홍익파크 1층 108·109호"
    }
]'::jsonb,
  '[
    "https://cheongna-arkone.vercel.app/images/ca/hero-poster.jpg",
    "https://cheongna-arkone.vercel.app/images/ca/loc-map.png",
    "https://cheongna-arkone.vercel.app/images/ca/route-1.png",
    "https://cheongna-arkone.vercel.app/images/ca/route-2.png",
    "https://cheongna-arkone.vercel.app/images/ca/route-3.png",
    "https://cheongna-arkone.vercel.app/images/ca/interior-1.jpg",
    "https://cheongna-arkone.vercel.app/images/ca/interior-2.jpg",
    "https://cheongna-arkone.vercel.app/images/ca/interior-3.jpg",
    "https://cheongna-arkone.vercel.app/images/ca/map-site.png"
]'::jsonb,
  '평면도·단지배치도는 공개 준비 중입니다. 방문 상담은 사전예약제로 운영되오니 미리 연락 부탁드립니다.',
  '인천광역시 서해구 중봉대로586번길 19 홍익파크 1층 108·109호',
  'https://cheongna-arkone.vercel.app/',
  true
)
on conflict (slug) do update set
  name      = excluded.name,
  headline  = excluded.headline,
  subhead   = excluded.subhead,
  hero_url  = excluded.hero_url,
  specs     = excluded.specs,
  images    = excluded.images,
  notice    = excluded.notice,
  address   = excluded.address,
  site_url  = excluded.site_url,
  published = excluded.published;

-- 확인
select slug, name, published,
       jsonb_array_length(specs)  as 사업개요,
       jsonb_array_length(images) as 홍보이미지
from public.card_sites order by slug;
