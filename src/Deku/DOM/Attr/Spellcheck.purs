module Deku.DOM.Attr.Spellcheck where

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

data Spellcheck = Spellcheck

instance Attr A_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Abbr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Acronym_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Address_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Applet_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Area_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Article_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Aside_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Audio_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr B_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Base_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Basefont_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Bdi_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Bdo_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Big_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Blockquote_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Body_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Br_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Button_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Canvas_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Caption_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Center_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Cite_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Code_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Col_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Colgroup_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Xdata_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Datalist_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dd_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Del_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Details_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dfn_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dialog_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dir_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Div_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dl_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Dt_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Em_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Embed_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Fieldset_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Figcaption_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Figure_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Font_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Footer_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Form_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Frame_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Frameset_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H1_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H2_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H3_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H4_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H5_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr H6_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Head_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Header_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Hr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Html_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr I_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Iframe_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Img_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Input_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Ins_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Kbd_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Label_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Legend_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Li_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Link_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Main_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Map_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Mark_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Meta_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Meter_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Nav_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Noframes_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Noscript_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Object_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Ol_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Optgroup_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Option_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Output_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr P_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Param_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Picture_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Pre_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Progress_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Q_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Rp_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Rt_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Ruby_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr S_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Samp_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Script_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Section_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Select_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Small_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Source_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Span_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Strike_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Strong_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Style_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Sub_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Summary_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Sup_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Svg_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Table_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Tbody_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Td_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Template_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Textarea_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Tfoot_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Th_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Thead_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Time_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Title_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Tr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Track_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Tt_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr U_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Ul_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Var_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Video_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr Wbr_ Spellcheck String where
  attr Spellcheck value = unsafeAttribute
    { key: "spellcheck", value: prop' value }

instance Attr everything Spellcheck Unit where
  attr Spellcheck _ = unsafeAttribute
    { key: "spellcheck", value: unset' }
