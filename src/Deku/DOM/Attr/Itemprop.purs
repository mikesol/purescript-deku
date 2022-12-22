module Deku.DOM.Attr.Itemprop where

import Prelude

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Abbr (Abbr_)
import Deku.DOM.Elt.Acronym (Acronym_)
import Deku.DOM.Elt.Address (Address_)
import Deku.DOM.Elt.Applet (Applet_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Article (Article_)
import Deku.DOM.Elt.Aside (Aside_)
import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.B (B_)
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.Basefont (Basefont_)
import Deku.DOM.Elt.Bdi (Bdi_)
import Deku.DOM.Elt.Bdo (Bdo_)
import Deku.DOM.Elt.Big (Big_)
import Deku.DOM.Elt.Blockquote (Blockquote_)
import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Br (Br_)
import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Canvas (Canvas_)
import Deku.DOM.Elt.Caption (Caption_)
import Deku.DOM.Elt.Center (Center_)
import Deku.DOM.Elt.Cite (Cite_)
import Deku.DOM.Elt.Code (Code_)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.DOM.Elt.Xdata (Xdata_)
import Deku.DOM.Elt.Datalist (Datalist_)
import Deku.DOM.Elt.Dd (Dd_)
import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Details (Details_)
import Deku.DOM.Elt.Dfn (Dfn_)
import Deku.DOM.Elt.Dialog (Dialog_)
import Deku.DOM.Elt.Dir (Dir_)
import Deku.DOM.Elt.Div (Div_)
import Deku.DOM.Elt.Dl (Dl_)
import Deku.DOM.Elt.Dt (Dt_)
import Deku.DOM.Elt.Em (Em_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Fieldset (Fieldset_)
import Deku.DOM.Elt.Figcaption (Figcaption_)
import Deku.DOM.Elt.Figure (Figure_)
import Deku.DOM.Elt.Font (Font_)
import Deku.DOM.Elt.Footer (Footer_)
import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Frame (Frame_)
import Deku.DOM.Elt.Frameset (Frameset_)
import Deku.DOM.Elt.H1 (H1_)
import Deku.DOM.Elt.H2 (H2_)
import Deku.DOM.Elt.H3 (H3_)
import Deku.DOM.Elt.H4 (H4_)
import Deku.DOM.Elt.H5 (H5_)
import Deku.DOM.Elt.H6 (H6_)
import Deku.DOM.Elt.Head (Head_)
import Deku.DOM.Elt.Header (Header_)
import Deku.DOM.Elt.Hr (Hr_)
import Deku.DOM.Elt.Html (Html_)
import Deku.DOM.Elt.I (I_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Kbd (Kbd_)
import Deku.DOM.Elt.Label (Label_)
import Deku.DOM.Elt.Legend (Legend_)
import Deku.DOM.Elt.Li (Li_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Main (Main_)
import Deku.DOM.Elt.Map (Map_)
import Deku.DOM.Elt.Mark (Mark_)
import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.DOM.Elt.Nav (Nav_)
import Deku.DOM.Elt.Noframes (Noframes_)
import Deku.DOM.Elt.Noscript (Noscript_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Ol (Ol_)
import Deku.DOM.Elt.Optgroup (Optgroup_)
import Deku.DOM.Elt.Option (Option_)
import Deku.DOM.Elt.Output (Output_)
import Deku.DOM.Elt.P (P_)
import Deku.DOM.Elt.Param (Param_)
import Deku.DOM.Elt.Picture (Picture_)
import Deku.DOM.Elt.Pre (Pre_)
import Deku.DOM.Elt.Progress (Progress_)
import Deku.DOM.Elt.Q (Q_)
import Deku.DOM.Elt.Rp (Rp_)
import Deku.DOM.Elt.Rt (Rt_)
import Deku.DOM.Elt.Ruby (Ruby_)
import Deku.DOM.Elt.S (S_)
import Deku.DOM.Elt.Samp (Samp_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Section (Section_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Small (Small_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Span (Span_)
import Deku.DOM.Elt.Strike (Strike_)
import Deku.DOM.Elt.Strong (Strong_)
import Deku.DOM.Elt.Style (Style_)
import Deku.DOM.Elt.Sub (Sub_)
import Deku.DOM.Elt.Summary (Summary_)
import Deku.DOM.Elt.Sup (Sup_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Template (Template_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Thead (Thead_)
import Deku.DOM.Elt.Time (Time_)
import Deku.DOM.Elt.Title (Title_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Tt (Tt_)
import Deku.DOM.Elt.U (U_)
import Deku.DOM.Elt.Ul (Ul_)
import Deku.DOM.Elt.Var (Var_)
import Deku.DOM.Elt.Video (Video_)
import Deku.DOM.Elt.Wbr (Wbr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Itemprop = Itemprop

instance Attr A_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Abbr_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Acronym_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Address_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Applet_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Area_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Article_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Aside_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Audio_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr B_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Base_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Basefont_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Bdi_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Bdo_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Big_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Blockquote_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Body_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Br_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Button_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Canvas_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Caption_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Center_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Cite_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Code_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Col_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Colgroup_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Xdata_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Datalist_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dd_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Del_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Details_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dfn_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dialog_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dir_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Div_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dl_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Dt_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Em_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Embed_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Fieldset_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Figcaption_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Figure_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Font_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Footer_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Form_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Frame_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Frameset_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H1_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H2_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H3_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H4_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H5_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr H6_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Head_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Header_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Hr_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Html_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr I_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Iframe_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Img_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Input_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Ins_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Kbd_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Label_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Legend_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Li_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Link_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Main_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Map_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Mark_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Meta_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Meter_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Nav_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Noframes_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Noscript_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Object_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Ol_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Optgroup_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Option_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Output_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr P_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Param_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Picture_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Pre_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Progress_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Q_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Rp_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Rt_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Ruby_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr S_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Samp_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Script_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Section_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Select_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Small_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Source_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Span_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Strike_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Strong_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Style_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Sub_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Summary_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Sup_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Svg_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Table_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Tbody_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Td_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Template_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Textarea_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Tfoot_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Th_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Thead_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Time_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Title_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Tr_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Track_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Tt_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr U_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Ul_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Var_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Video_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr Wbr_ Itemprop String where
  attr Itemprop value = unsafeAttribute { key: "itemprop", value: prop' value }

instance Attr everything Itemprop Unit where
  attr Itemprop _ = unsafeAttribute
    { key: "itemprop", value: unset' }
