module Deku.DOM.Attr.Dir where
import Prelude
import FRP.Event as Event
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
data Dir = Dir
instance Attr A_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr A_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr A_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Abbr_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Abbr_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Abbr_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Acronym_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Acronym_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Acronym_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Address_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Address_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Address_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Applet_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Applet_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Applet_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Area_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Area_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Area_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Article_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Article_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Article_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Aside_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Aside_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Aside_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Audio_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Audio_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Audio_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr B_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr B_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr B_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Base_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Base_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Base_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Basefont_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Basefont_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Basefont_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Bdi_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Bdi_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Bdi_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Bdo_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Bdo_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Bdo_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Big_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Big_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Big_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Blockquote_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Blockquote_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Blockquote_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Body_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Body_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Body_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Br_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Br_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Br_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Button_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Button_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Button_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Canvas_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Canvas_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Canvas_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Caption_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Caption_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Caption_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Center_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Center_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Center_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Cite_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Cite_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Cite_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Code_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Code_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Code_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Col_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Col_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Col_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Colgroup_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Colgroup_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Colgroup_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Xdata_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Xdata_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Xdata_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Datalist_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Datalist_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Datalist_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Dd_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Dd_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Dd_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Del_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Del_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Del_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Details_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Details_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Details_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Dfn_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Dfn_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Dfn_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Dialog_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Dialog_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Dialog_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Dir_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Dir_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Dir_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Div_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Div_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Div_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Dl_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Dl_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Dl_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Dt_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Dt_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Dt_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Em_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Em_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Em_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Embed_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Embed_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Embed_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Fieldset_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Fieldset_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Fieldset_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Figcaption_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Figcaption_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Figcaption_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Figure_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Figure_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Figure_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Font_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Font_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Font_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Footer_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Footer_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Footer_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Form_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Form_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Form_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Frame_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Frame_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Frame_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Frameset_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Frameset_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Frameset_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr H1_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr H1_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr H1_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr H2_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr H2_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr H2_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr H3_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr H3_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr H3_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr H4_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr H4_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr H4_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr H5_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr H5_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr H5_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr H6_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr H6_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr H6_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Head_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Head_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Head_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Header_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Header_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Header_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Hr_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Hr_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Hr_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Html_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Html_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Html_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr I_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr I_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr I_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Iframe_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Iframe_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Iframe_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Img_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Img_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Img_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Input_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Input_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Input_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Ins_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Ins_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Ins_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Kbd_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Kbd_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Kbd_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Label_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Label_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Label_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Legend_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Legend_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Legend_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Li_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Li_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Li_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Link_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Link_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Link_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Main_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Main_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Main_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Map_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Map_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Map_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Mark_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Mark_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Mark_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Meta_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Meta_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Meta_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Meter_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Meter_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Meter_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Nav_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Nav_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Nav_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Noframes_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Noframes_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Noframes_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Noscript_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Noscript_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Noscript_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Object_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Object_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Object_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Ol_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Ol_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Ol_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Optgroup_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Optgroup_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Optgroup_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Option_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Option_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Option_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Output_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Output_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Output_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr P_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr P_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr P_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Param_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Param_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Param_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Picture_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Picture_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Picture_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Pre_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Pre_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Pre_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Progress_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Progress_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Progress_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Q_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Q_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Q_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Rp_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Rp_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Rp_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Rt_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Rt_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Rt_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Ruby_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Ruby_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Ruby_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr S_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr S_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr S_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Samp_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Samp_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Samp_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Script_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Script_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Script_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Section_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Section_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Section_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Select_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Select_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Select_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Small_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Small_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Small_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Source_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Source_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Source_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Span_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Span_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Span_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Strike_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Strike_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Strike_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Strong_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Strong_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Strong_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Style_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Style_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Style_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Sub_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Sub_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Sub_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Summary_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Summary_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Summary_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Sup_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Sup_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Sup_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Svg_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Svg_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Svg_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Table_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Table_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Table_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Tbody_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Tbody_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Tbody_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Td_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Td_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Td_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Template_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Template_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Template_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Textarea_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Textarea_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Textarea_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Tfoot_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Tfoot_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Tfoot_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Th_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Th_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Th_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Thead_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Thead_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Thead_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Time_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Time_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Time_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Title_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Title_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Title_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Tr_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Tr_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Tr_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Track_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Track_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Track_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Tt_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Tt_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Tt_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr U_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr U_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr U_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Ul_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Ul_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Ul_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Var_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Var_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Var_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Video_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Video_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Video_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr Wbr_ Dir  String  where
  attr Dir value = unsafeAttribute (  { key: "dir", value: prop' value  } <$ _)
instance Attr Wbr_ Dir (Event.Event Unit -> Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \value ->
    { key: "dir", value: prop' value })) eventValue)
instance Attr Wbr_ Dir (Event.Event  String ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \value ->
    { key: "dir", value: prop' value }
instance Attr everything Dir  Unit  where
  attr Dir _ = unsafeAttribute (  { key: "dir", value: unset'  } <$ _)
instance Attr everything Dir (Event.Event Unit -> Event.Event  Unit ) where
  attr Dir eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "dir", value: unset' })) eventValue)
instance Attr everything Dir (Event.Event  Unit ) where
  attr Dir eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "dir", value: unset' }