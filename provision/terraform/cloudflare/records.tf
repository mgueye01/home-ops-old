resource "cloudflare_record" "apex" {
  name    = "ipv4"
  zone_id = data.cloudflare_zone.domain.id
  value   = chomp(data.http.ipv4_lookup_raw.response_body)
  proxied = true
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "root" {
  name    = "g-eye.io"
  zone_id = data.cloudflare_zone.domain.id
  value   = "ipv4.g-eye.io"
  proxied = true
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "home_cname" {
  name    = module.onepassword_item.fields["cname-wan-ip"]
  zone_id = data.cloudflare_zone.domain.id
  value   = "ipv4.g-eye.io"
  proxied = false
  type    = "CNAME"
  ttl     = 1
}

# resource "cloudflare_record" "uptimerobot_status" {
#   name    = "status"
#   zone_id = data.cloudflare_zone.domain.id
#   value   = "stats.uptimerobot.com"
#   proxied = false
#   type    = "CNAME"
#   ttl     = 1
# }
