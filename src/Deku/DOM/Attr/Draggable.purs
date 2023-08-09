module Deku.DOM.Attr.Draggable where
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
data Draggable = Draggable
instance Attr A_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr A_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr A_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Abbr_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Abbr_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Abbr_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Acronym_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Acronym_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Acronym_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Address_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Address_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Address_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Applet_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Applet_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Applet_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Area_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Area_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Area_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Article_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Article_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Article_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Aside_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Aside_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Aside_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Audio_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Audio_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Audio_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr B_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr B_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr B_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Base_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Base_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Base_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Basefont_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Basefont_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Basefont_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Bdi_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Bdi_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Bdi_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Bdo_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Bdo_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Bdo_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Big_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Big_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Big_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Blockquote_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Blockquote_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Blockquote_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Body_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Body_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Body_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Br_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Br_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Br_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Button_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Button_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Button_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Canvas_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Canvas_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Canvas_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Caption_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Caption_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Caption_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Center_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Center_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Center_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Cite_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Cite_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Cite_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Code_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Code_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Code_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Col_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Col_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Col_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Colgroup_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Colgroup_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Colgroup_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Xdata_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Xdata_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Xdata_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Datalist_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Datalist_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Datalist_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Dd_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Dd_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Dd_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Del_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Del_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Del_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Details_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Details_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Details_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Dfn_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Dfn_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Dfn_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Dialog_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Dialog_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Dialog_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Dir_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Dir_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Dir_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Div_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Div_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Div_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Dl_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Dl_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Dl_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Dt_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Dt_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Dt_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Em_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Em_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Em_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Embed_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Embed_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Embed_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Fieldset_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Fieldset_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Fieldset_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Figcaption_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Figcaption_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Figcaption_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Figure_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Figure_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Figure_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Font_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Font_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Font_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Footer_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Footer_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Footer_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Form_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Form_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Form_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Frame_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Frame_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Frame_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Frameset_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Frameset_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Frameset_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr H1_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr H1_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr H1_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr H2_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr H2_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr H2_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr H3_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr H3_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr H3_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr H4_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr H4_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr H4_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr H5_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr H5_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr H5_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr H6_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr H6_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr H6_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Head_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Head_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Head_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Header_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Header_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Header_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Hr_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Hr_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Hr_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Html_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Html_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Html_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr I_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr I_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr I_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Iframe_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Iframe_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Iframe_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Img_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Img_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Img_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Input_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Input_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Input_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Ins_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Ins_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Ins_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Kbd_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Kbd_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Kbd_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Label_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Label_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Label_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Legend_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Legend_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Legend_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Li_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Li_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Li_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Link_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Link_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Link_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Main_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Main_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Main_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Map_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Map_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Map_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Mark_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Mark_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Mark_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Meta_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Meta_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Meta_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Meter_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Meter_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Meter_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Nav_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Nav_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Nav_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Noframes_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Noframes_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Noframes_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Noscript_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Noscript_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Noscript_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Object_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Object_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Object_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Ol_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Ol_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Ol_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Optgroup_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Optgroup_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Optgroup_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Option_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Option_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Option_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Output_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Output_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Output_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr P_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr P_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr P_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Param_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Param_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Param_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Picture_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Picture_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Picture_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Pre_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Pre_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Pre_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Progress_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Progress_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Progress_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Q_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Q_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Q_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Rp_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Rp_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Rp_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Rt_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Rt_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Rt_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Ruby_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Ruby_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Ruby_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr S_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr S_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr S_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Samp_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Samp_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Samp_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Script_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Script_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Script_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Section_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Section_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Section_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Select_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Select_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Select_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Small_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Small_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Small_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Source_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Source_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Source_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Span_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Span_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Span_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Strike_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Strike_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Strike_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Strong_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Strong_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Strong_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Style_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Style_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Style_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Sub_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Sub_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Sub_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Summary_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Summary_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Summary_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Sup_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Sup_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Sup_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Svg_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Svg_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Svg_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Table_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Table_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Table_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Tbody_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Tbody_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Tbody_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Td_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Td_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Td_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Template_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Template_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Template_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Textarea_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Textarea_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Textarea_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Tfoot_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Tfoot_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Tfoot_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Th_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Th_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Th_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Thead_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Thead_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Thead_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Time_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Time_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Time_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Title_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Title_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Title_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Tr_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Tr_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Tr_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Track_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Track_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Track_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Tt_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Tt_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Tt_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr U_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr U_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr U_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Ul_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Ul_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Ul_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Var_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Var_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Var_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Video_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Video_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Video_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr Wbr_ Draggable  String  where
  attr Draggable value = unsafeAttribute (  
    { key: "draggable", value: prop' value  } <$ _)
instance Attr Wbr_ Draggable (Event.Event Unit -> Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \value -> { key: "draggable", value: prop' value })) eventValue)
instance Attr Wbr_ Draggable (Event.Event  String ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "draggable", value: prop' value }
instance Attr everything Draggable  Unit  where
  attr Draggable _ = unsafeAttribute (  
    { key: "draggable", value: unset'  } <$ _)
instance Attr everything Draggable (Event.Event Unit -> Event.Event  Unit ) where
  attr Draggable eventValue = unsafeAttribute (map (map (
    \_ -> { key: "draggable", value: unset' })) eventValue)
instance Attr everything Draggable (Event.Event  Unit ) where
  attr Draggable eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "draggable", value: unset' }