module Deku.DOM.Attr.Translate where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

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

data Translate = Translate

instance Attr A_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr A_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr A_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Abbr_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Abbr_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Abbr_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Acronym_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Acronym_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Acronym_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Address_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Address_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Address_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Applet_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Applet_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Applet_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Area_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Area_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Area_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Article_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Article_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Article_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Aside_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Aside_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Aside_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Audio_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Audio_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Audio_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr B_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr B_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr B_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Base_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Base_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Base_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Basefont_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Basefont_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Basefont_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Bdi_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Bdi_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Bdi_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Bdo_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Bdo_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Bdo_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Big_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Big_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Big_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Blockquote_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Blockquote_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Blockquote_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Body_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Body_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Body_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Br_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Br_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Br_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Button_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Button_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Button_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Canvas_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Canvas_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Canvas_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Caption_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Caption_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Caption_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Center_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Center_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Center_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Cite_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Cite_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Cite_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Code_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Code_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Code_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Col_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Col_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Col_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Colgroup_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Colgroup_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Colgroup_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Xdata_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Xdata_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Xdata_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Datalist_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Datalist_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Datalist_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Dd_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Dd_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Dd_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Del_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Del_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Del_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Details_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Details_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Details_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Dfn_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Dfn_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Dfn_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Dialog_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Dialog_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Dialog_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Dir_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Dir_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Dir_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Div_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Div_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Div_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Dl_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Dl_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Dl_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Dt_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Dt_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Dt_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Em_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Em_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Em_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Embed_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Embed_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Embed_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Fieldset_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Fieldset_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Fieldset_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Figcaption_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Figcaption_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Figcaption_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Figure_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Figure_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Figure_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Font_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Font_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Font_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Footer_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Footer_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Footer_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Form_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Form_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Form_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Frame_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Frame_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Frame_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Frameset_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Frameset_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Frameset_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr H1_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr H1_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr H1_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr H2_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr H2_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr H2_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr H3_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr H3_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr H3_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr H4_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr H4_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr H4_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr H5_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr H5_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr H5_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr H6_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr H6_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr H6_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Head_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Head_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Head_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Header_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Header_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Header_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Hr_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Hr_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Hr_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Html_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Html_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Html_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr I_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr I_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr I_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Iframe_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Iframe_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Iframe_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Img_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Img_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Img_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Input_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Input_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Input_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Ins_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Ins_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Ins_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Kbd_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Kbd_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Kbd_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Label_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Label_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Label_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Legend_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Legend_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Legend_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Li_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Li_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Li_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Link_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Link_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Link_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Main_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Main_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Main_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Map_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Map_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Map_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Mark_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Mark_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Mark_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Meta_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Meta_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Meta_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Meter_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Meter_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Meter_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Nav_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Nav_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Nav_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Noframes_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Noframes_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Noframes_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Noscript_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Noscript_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Noscript_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Object_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Object_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Object_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Ol_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Ol_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Ol_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Optgroup_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Optgroup_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Optgroup_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Option_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Option_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Option_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Output_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Output_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Output_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr P_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr P_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr P_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Param_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Param_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Param_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Picture_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Picture_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Picture_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Pre_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Pre_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Pre_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Progress_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Progress_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Progress_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Q_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Q_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Q_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Rp_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Rp_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Rp_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Rt_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Rt_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Rt_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Ruby_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Ruby_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Ruby_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr S_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr S_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr S_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Samp_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Samp_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Samp_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Script_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Script_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Script_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Section_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Section_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Section_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Select_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Select_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Select_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Small_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Small_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Small_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Source_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Source_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Source_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Span_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Span_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Span_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Strike_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Strike_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Strike_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Strong_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Strong_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Strong_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Style_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Style_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Style_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Sub_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Sub_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Sub_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Summary_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Summary_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Summary_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Sup_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Sup_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Sup_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Svg_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Svg_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Svg_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Table_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Table_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Table_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Tbody_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Tbody_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Tbody_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Td_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Td_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Td_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Template_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Template_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Template_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Textarea_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Textarea_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Textarea_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Tfoot_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Tfoot_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Tfoot_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Th_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Th_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Th_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Thead_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Thead_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Thead_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Time_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Time_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Time_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Title_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Title_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Title_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Tr_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Tr_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Tr_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Track_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Track_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Track_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Tt_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Tt_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Tt_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr U_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr U_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr U_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Ul_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Ul_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Ul_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Var_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Var_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Var_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Video_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Video_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Video_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr Wbr_ Translate (NonEmpty.NonEmpty Event.Event  String ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "translate", value: prop' value })
instance Attr Wbr_ Translate  String  where
  attr Translate value = unsafeAttribute $ This $ pure $
    { key: "translate", value: prop' value }
instance Attr Wbr_ Translate (Event.Event  String ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "translate", value: prop' value }

instance Attr everything Translate (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Translate bothValues = unsafeAttribute $ Both (pure 
    { key: "translate", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "translate", value: unset' })
instance Attr everything Translate  Unit  where
  attr Translate _ = unsafeAttribute $ This $ pure $
    { key: "translate", value: unset' }
instance Attr everything Translate (Event.Event  Unit ) where
  attr Translate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "translate", value: unset' }
