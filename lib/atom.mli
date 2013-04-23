(*
 * Copyright (c) 2010 Anil Madhavapeddy <anil@recoil.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *)

type author = {
  name  : string;
  uri   : string option;
  email : string option;
}

type date = int * int * int * int * int

val compare : date -> date -> int

type link = {
  rel : [`self|`alternate];
  href: string;
  typ : string option;
}

type meta = {
  id      : string;
  title   : string;
  subtitle: string option;
  author  : author option;
  rights  : string option;
  updated : date;
  links   : link list;
}

type summary = string option

type entry = {
  entry   : meta;
  summary : summary;
  content : Xml.t;
}

type feed = {
  feed    : meta;
  entries : entry list;
}

val xml_of_feed : ?self:string -> feed -> Xml.t
