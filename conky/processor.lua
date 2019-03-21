--
require 'cairo' 
function conky_main()
  -- Fenster prüfen
  if conky_window == nil then
    return
  end
  -- Bereich holen:
  cs = cairo_xlib_surface_create(conky_window.display,
      conky_window.drawable,
      conky_window.visual,
      conky_window.width,
      conky_window.height)
  cr = cairo_create(cs)
  -- Prozessorauslastung auslesen:
  cpuload = tonumber(conky_parse("${cpu}"))
  print(cpuload)
  text = "Processor load: "..cpuload.."%"
  -- Informationen auf den Bildschirm schreiben:
  cairo_select_font_face(cr, "Mono", CAIRO_FONT_SLANT_NORMAL,
    CAIRO_FONT_WEIGHT_NORMAL);
  cairo_set_font_size(cr, 12)
  cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 1.0)
  cairo_move_to(cr, 10, 25)
  cairo_show_text(cr, text)
  cairo_stroke(cr)
  -- weißen Ring zeichnen:
  cairo_set_line_width(cr, 20)
  cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 1.0)
  cairo_arc(cr, 75, 100, 50, 0, 2 * math.pi)
  cairo_stroke(cr)
  -- rote Markierung zeichnen:
  cairo_set_line_width(cr, 20)
  cairo_set_source_rgba(cr, 1.0, 0, 0, 1.0)
  angle = cpuload * ((2 * math.pi) / 100)
  cairo_arc(cr, 75, 100, 50, 0 - (math.pi / 2), angle - (math.pi / 2))
  cairo_stroke(cr)
  -- Aufraeumen:
  cairo_destroy(cr)
  cairo_surface_destroy(cs)
  cr = nil
end
