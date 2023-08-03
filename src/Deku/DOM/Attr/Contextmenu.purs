module Deku.DOM.Attr.Contextmenu where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
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

data Contextmenu = Contextmenu

instance Attr A_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr A_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr A_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr A_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr A_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Abbr_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Abbr_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Abbr_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Abbr_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Abbr_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Acronym_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Acronym_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Acronym_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Acronym_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Acronym_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Address_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Address_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Address_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Address_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Address_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Applet_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Applet_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Applet_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Applet_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Applet_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Area_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Area_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Area_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Area_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Area_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Article_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Article_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Article_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Article_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Article_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Aside_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Aside_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Aside_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Aside_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Aside_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Audio_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Audio_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Audio_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Audio_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Audio_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr B_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr B_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr B_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr B_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr B_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Base_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Base_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Base_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Base_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Base_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Basefont_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Basefont_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Basefont_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Basefont_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Basefont_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Bdi_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Bdi_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Bdi_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Bdi_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Bdi_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Bdo_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Bdo_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Bdo_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Bdo_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Bdo_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Big_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Big_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Big_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Big_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Big_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Blockquote_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Blockquote_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Blockquote_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Blockquote_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Blockquote_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Body_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Body_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Body_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Body_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Body_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Br_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Br_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Br_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Br_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Br_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Button_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Button_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Button_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Button_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Button_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Canvas_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Canvas_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Canvas_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Canvas_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Canvas_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Caption_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Caption_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Caption_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Caption_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Caption_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Center_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Center_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Center_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Center_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Center_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Cite_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Cite_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Cite_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Cite_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Cite_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Code_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Code_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Code_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Code_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Code_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Col_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Col_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Col_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Col_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Col_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Colgroup_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Colgroup_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Colgroup_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Colgroup_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Colgroup_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Xdata_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Xdata_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Xdata_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Xdata_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Xdata_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Datalist_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Datalist_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Datalist_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Datalist_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Datalist_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dd_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dd_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dd_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Dd_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dd_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Del_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Del_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Del_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Del_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Del_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Details_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Details_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Details_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Details_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Details_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dfn_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dfn_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dfn_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Dfn_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dfn_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dialog_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dialog_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dialog_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Dialog_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dialog_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dir_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dir_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dir_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Dir_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dir_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Div_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Div_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Div_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Div_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Div_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dl_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dl_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dl_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Dl_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dl_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dt_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dt_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Dt_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Dt_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Dt_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Em_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Em_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Em_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Em_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Em_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Embed_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Embed_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Embed_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Embed_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Embed_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Fieldset_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Fieldset_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Fieldset_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Fieldset_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Fieldset_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Figcaption_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Figcaption_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Figcaption_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Figcaption_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Figcaption_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Figure_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Figure_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Figure_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Figure_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Figure_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Font_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Font_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Font_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Font_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Font_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Footer_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Footer_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Footer_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Footer_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Footer_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Form_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Form_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Form_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Form_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Form_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Frame_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Frame_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Frame_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Frame_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Frame_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Frameset_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Frameset_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Frameset_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Frameset_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Frameset_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H1_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H1_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H1_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr H1_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H1_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H2_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H2_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H2_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr H2_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H2_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H3_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H3_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H3_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr H3_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H3_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H4_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H4_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H4_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr H4_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H4_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H5_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H5_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H5_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr H5_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H5_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H6_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H6_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr H6_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr H6_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr H6_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Head_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Head_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Head_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Head_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Head_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Header_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Header_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Header_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Header_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Header_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Hr_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Hr_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Hr_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Hr_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Hr_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Html_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Html_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Html_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Html_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Html_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr I_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr I_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr I_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr I_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr I_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Iframe_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Iframe_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Iframe_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Iframe_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Iframe_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Img_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Img_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Img_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Img_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Img_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Input_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Input_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Input_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Input_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Input_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Ins_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Ins_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Ins_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Ins_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Ins_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Kbd_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Kbd_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Kbd_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Kbd_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Kbd_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Label_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Label_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Label_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Label_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Label_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Legend_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Legend_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Legend_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Legend_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Legend_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Li_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Li_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Li_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Li_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Li_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Link_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Link_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Link_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Link_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Link_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Main_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Main_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Main_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Main_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Main_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Map_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Map_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Map_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Map_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Map_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Mark_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Mark_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Mark_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Mark_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Mark_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Meta_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Meta_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Meta_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Meta_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Meta_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Meter_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Meter_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Meter_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Meter_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Meter_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Nav_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Nav_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Nav_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Nav_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Nav_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Noframes_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Noframes_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Noframes_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Noframes_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Noframes_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Noscript_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Noscript_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Noscript_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Noscript_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Noscript_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Object_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Object_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Object_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Object_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Object_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Ol_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Ol_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Ol_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Ol_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Ol_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Optgroup_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Optgroup_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Optgroup_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Optgroup_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Optgroup_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Option_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Option_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Option_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Option_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Option_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Output_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Output_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Output_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Output_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Output_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr P_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr P_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr P_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr P_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr P_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Param_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Param_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Param_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Param_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Param_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Picture_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Picture_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Picture_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Picture_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Picture_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Pre_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Pre_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Pre_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Pre_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Pre_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Progress_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Progress_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Progress_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Progress_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Progress_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Q_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Q_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Q_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Q_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Q_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Rp_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Rp_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Rp_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Rp_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Rp_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Rt_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Rt_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Rt_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Rt_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Rt_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Ruby_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Ruby_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Ruby_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Ruby_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Ruby_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr S_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr S_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr S_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr S_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr S_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Samp_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Samp_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Samp_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Samp_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Samp_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Script_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Script_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Script_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Script_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Script_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Section_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Section_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Section_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Section_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Section_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Select_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Select_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Select_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Select_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Select_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Small_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Small_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Small_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Small_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Small_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Source_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Source_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Source_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Source_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Source_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Span_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Span_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Span_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Span_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Span_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Strike_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Strike_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Strike_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Strike_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Strike_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Strong_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Strong_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Strong_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Strong_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Strong_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Style_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Style_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Style_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Style_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Style_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Sub_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Sub_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Sub_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Sub_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Sub_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Summary_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Summary_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Summary_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Summary_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Summary_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Sup_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Sup_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Sup_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Sup_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Sup_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Svg_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Svg_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Svg_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Svg_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Svg_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Table_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Table_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Table_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Table_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Table_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Tbody_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Tbody_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Tbody_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Tbody_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Tbody_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Td_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Td_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Td_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Td_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Td_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Template_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Template_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Template_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Template_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Template_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Textarea_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Textarea_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Textarea_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Textarea_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Textarea_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Tfoot_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Tfoot_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Tfoot_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Tfoot_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Tfoot_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Th_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Th_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Th_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Th_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Th_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Thead_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Thead_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Thead_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Thead_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Thead_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Time_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Time_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Time_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Time_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Time_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Title_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Title_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Title_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Title_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Title_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Tr_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Tr_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Tr_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Tr_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Tr_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Track_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Track_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Track_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Track_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Track_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Tt_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Tt_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Tt_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Tt_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Tt_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr U_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr U_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr U_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr U_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr U_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Ul_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Ul_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Ul_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Ul_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Ul_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Var_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Var_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Var_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Var_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Var_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Video_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Video_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Video_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Video_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Video_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Wbr_ Contextmenu (NonEmpty.NonEmpty Event.Event  String ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Wbr_ Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "contextmenu", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "contextmenu", value: prop' value })
instance Attr Wbr_ Contextmenu  String  where
  attr Contextmenu value = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: prop' value }
instance Attr Wbr_ Contextmenu (Event.Event  String ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr Wbr_ Contextmenu (ST.ST Global.Global  String ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "contextmenu", value: prop' value }

instance Attr everything Contextmenu (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Contextmenu bothValues = unsafeAttribute $ Both (pure 
    { key: "contextmenu", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "contextmenu", value: unset' })
instance Attr everything Contextmenu (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Contextmenu (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "contextmenu", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "contextmenu", value: unset' })
instance Attr everything Contextmenu  Unit  where
  attr Contextmenu _ = unsafeAttribute $ This $ pure $
    { key: "contextmenu", value: unset' }
instance Attr everything Contextmenu (Event.Event  Unit ) where
  attr Contextmenu eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "contextmenu", value: unset' }

instance Attr everything Contextmenu (ST.ST Global.Global  Unit ) where
  attr Contextmenu stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "contextmenu", value: unset' }
