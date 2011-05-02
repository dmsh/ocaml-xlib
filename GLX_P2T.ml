(** OCaml bindings to the GLX_EXT_texture_from_pixmap extension *)
(* Copyright (C) 2008, 2009 by Florent Monnier <fmonnier@linux-nantes.org>
 *
 * OCaml-Xlib is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License,
 * or (at your option) any later version.
 *
 * OCaml-Xlib is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with OCaml-Xlib.  If not, see:
 * <http://www.gnu.org/licenses/>
 *)

(**
  {b Warning:} This module is currently under construction.

  This module is a binding to this GLX extension:
  {{:http://www.opengl.org/registry/specs/EXT/texture_from_pixmap.txt}GLX_EXT_texture_from_pixmap}
*)

external init_glx_p2t: unit -> unit = "ml_init_glx_p2t"
let _ = init_glx_p2t() ;;

type buffer_param =
  | GLX_FRONT_LEFT_EXT
  | GLX_FRONT_RIGHT_EXT
  | GLX_BACK_LEFT_EXT
  | GLX_BACK_RIGHT_EXT
  | GLX_FRONT_EXT
  | GLX_BACK_EXT
  | GLX_AUX0_EXT
  | GLX_AUX1_EXT
  | GLX_AUX2_EXT
  | GLX_AUX3_EXT
  | GLX_AUX4_EXT
  | GLX_AUX5_EXT
  | GLX_AUX6_EXT
  | GLX_AUX7_EXT
  | GLX_AUX8_EXT
  | GLX_AUX9_EXT

external glXBindTexImageEXT: dpy:Xlib.display -> drawable:'a GLX.glXDrawable -> buffer:buffer_param ->
    attrib_list:'a list (* TODO *) -> unit
    = "ml_glXBindTexImageEXT"

external glXReleaseTexImageEXT: dpy:Xlib.display -> drawable:'a GLX.glXDrawable -> buffer:buffer_param -> unit
    = "ml_glXReleaseTexImageEXT"


type glx_texture_target_ext =
  | GLX_TEXTURE_1D_EXT
  | GLX_TEXTURE_2D_EXT
  | GLX_TEXTURE_RECTANGLE_EXT

type glx_texture_format_ext =
  | GLX_TEXTURE_FORMAT_NONE_EXT
  | GLX_TEXTURE_FORMAT_RGB_EXT
  | GLX_TEXTURE_FORMAT_RGBA_EXT

type glx_create_pixmap_attrib =
  | GLX_TEXTURE_FORMAT_EXT of glx_texture_format_ext
  | GLX_TEXTURE_TARGET_EXT of glx_texture_target_ext
  | GLX_MIPMAP_TEXTURE_EXT of bool

external glXCreatePixmapEXT: dpy:Xlib.display -> config:GLX.glXFBConfig ->
                             pixmap:Xlib.pixmap -> attribs:'a list -> GLX.glXPixmap = "ml_glXCreatePixmapEXT"


