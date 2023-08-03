module Deku.DOM.Attr.Autocapitalize where

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

data Autocapitalize = Autocapitalize

instance Attr A_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr A_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr A_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr A_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr A_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Abbr_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Abbr_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Abbr_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Abbr_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Abbr_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Acronym_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Acronym_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Acronym_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Acronym_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Acronym_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Address_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Address_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Address_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Address_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Address_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Applet_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Applet_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Applet_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Applet_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Applet_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Area_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Area_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Area_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Area_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Area_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Article_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Article_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Article_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Article_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Article_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Aside_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Aside_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Aside_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Aside_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Aside_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Audio_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Audio_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Audio_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Audio_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Audio_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr B_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr B_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr B_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr B_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr B_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Base_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Base_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Base_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Base_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Base_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Basefont_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Basefont_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Basefont_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Basefont_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Basefont_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Bdi_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Bdi_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Bdi_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Bdi_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Bdi_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Bdo_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Bdo_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Bdo_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Bdo_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Bdo_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Big_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Big_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Big_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Big_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Big_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Blockquote_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Blockquote_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Blockquote_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Blockquote_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Blockquote_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Body_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Body_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Body_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Body_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Body_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Br_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Br_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Br_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Br_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Br_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Button_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Button_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Button_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Button_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Button_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Canvas_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Canvas_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Canvas_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Canvas_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Canvas_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Caption_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Caption_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Caption_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Caption_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Caption_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Center_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Center_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Center_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Center_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Center_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Cite_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Cite_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Cite_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Cite_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Cite_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Code_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Code_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Code_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Code_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Code_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Col_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Col_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Col_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Col_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Col_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Colgroup_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Colgroup_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Colgroup_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Colgroup_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Colgroup_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Xdata_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Xdata_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Xdata_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Xdata_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Xdata_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Datalist_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Datalist_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Datalist_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Datalist_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Datalist_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dd_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dd_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dd_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Dd_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dd_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Del_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Del_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Del_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Del_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Del_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Details_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Details_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Details_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Details_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Details_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dfn_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dfn_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dfn_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Dfn_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dfn_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dialog_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dialog_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dialog_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Dialog_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dialog_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dir_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dir_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dir_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Dir_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dir_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Div_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Div_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Div_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Div_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Div_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dl_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dl_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dl_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Dl_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dl_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dt_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dt_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Dt_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Dt_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Dt_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Em_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Em_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Em_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Em_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Em_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Embed_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Embed_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Embed_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Embed_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Embed_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Fieldset_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Fieldset_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Fieldset_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Fieldset_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Fieldset_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Figcaption_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Figcaption_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Figcaption_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Figcaption_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Figcaption_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Figure_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Figure_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Figure_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Figure_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Figure_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Font_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Font_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Font_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Font_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Font_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Footer_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Footer_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Footer_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Footer_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Footer_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Form_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Form_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Form_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Form_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Form_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Frame_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Frame_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Frame_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Frame_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Frame_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Frameset_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Frameset_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Frameset_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Frameset_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Frameset_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H1_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H1_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H1_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr H1_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H1_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H2_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H2_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H2_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr H2_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H2_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H3_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H3_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H3_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr H3_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H3_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H4_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H4_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H4_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr H4_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H4_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H5_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H5_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H5_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr H5_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H5_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H6_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H6_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr H6_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr H6_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr H6_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Head_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Head_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Head_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Head_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Head_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Header_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Header_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Header_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Header_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Header_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Hr_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Hr_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Hr_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Hr_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Hr_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Html_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Html_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Html_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Html_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Html_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr I_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr I_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr I_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr I_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr I_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Iframe_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Iframe_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Iframe_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Iframe_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Iframe_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Img_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Img_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Img_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Img_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Img_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Input_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Input_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Input_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Input_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Input_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Ins_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Ins_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Ins_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Ins_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Ins_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Kbd_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Kbd_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Kbd_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Kbd_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Kbd_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Label_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Label_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Label_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Label_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Label_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Legend_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Legend_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Legend_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Legend_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Legend_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Li_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Li_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Li_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Li_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Li_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Link_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Link_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Link_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Link_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Link_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Main_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Main_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Main_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Main_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Main_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Map_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Map_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Map_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Map_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Map_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Mark_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Mark_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Mark_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Mark_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Mark_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Meta_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Meta_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Meta_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Meta_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Meta_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Meter_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Meter_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Meter_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Meter_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Meter_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Nav_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Nav_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Nav_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Nav_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Nav_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Noframes_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Noframes_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Noframes_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Noframes_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Noframes_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Noscript_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Noscript_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Noscript_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Noscript_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Noscript_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Object_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Object_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Object_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Object_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Object_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Ol_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Ol_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Ol_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Ol_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Ol_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Optgroup_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Optgroup_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Optgroup_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Optgroup_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Optgroup_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Option_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Option_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Option_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Option_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Option_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Output_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Output_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Output_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Output_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Output_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr P_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr P_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr P_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr P_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr P_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Param_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Param_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Param_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Param_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Param_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Picture_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Picture_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Picture_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Picture_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Picture_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Pre_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Pre_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Pre_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Pre_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Pre_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Progress_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Progress_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Progress_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Progress_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Progress_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Q_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Q_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Q_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Q_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Q_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Rp_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Rp_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Rp_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Rp_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Rp_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Rt_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Rt_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Rt_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Rt_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Rt_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Ruby_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Ruby_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Ruby_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Ruby_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Ruby_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr S_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr S_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr S_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr S_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr S_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Samp_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Samp_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Samp_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Samp_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Samp_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Script_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Script_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Script_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Script_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Script_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Section_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Section_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Section_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Section_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Section_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Select_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Select_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Select_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Select_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Select_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Small_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Small_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Small_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Small_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Small_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Source_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Source_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Source_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Source_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Source_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Span_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Span_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Span_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Span_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Span_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Strike_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Strike_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Strike_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Strike_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Strike_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Strong_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Strong_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Strong_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Strong_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Strong_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Style_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Style_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Style_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Style_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Style_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Sub_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Sub_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Sub_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Sub_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Sub_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Summary_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Summary_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Summary_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Summary_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Summary_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Sup_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Sup_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Sup_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Sup_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Sup_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Svg_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Svg_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Svg_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Svg_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Svg_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Table_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Table_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Table_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Table_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Table_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Tbody_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Tbody_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Tbody_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Tbody_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Tbody_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Td_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Td_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Td_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Td_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Td_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Template_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Template_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Template_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Template_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Template_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Textarea_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Textarea_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Textarea_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Textarea_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Textarea_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Tfoot_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Tfoot_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Tfoot_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Tfoot_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Tfoot_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Th_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Th_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Th_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Th_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Th_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Thead_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Thead_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Thead_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Thead_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Thead_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Time_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Time_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Time_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Time_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Time_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Title_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Title_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Title_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Title_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Title_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Tr_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Tr_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Tr_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Tr_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Tr_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Track_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Track_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Track_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Track_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Track_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Tt_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Tt_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Tt_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Tt_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Tt_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr U_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr U_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr U_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr U_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr U_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Ul_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Ul_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Ul_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Ul_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Ul_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Var_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Var_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Var_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Var_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Var_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Video_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Video_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Video_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Video_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Video_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Wbr_ Autocapitalize (NonEmpty.NonEmpty Event.Event  String ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Wbr_ Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "autocapitalize", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "autocapitalize", value: prop' value })
instance Attr Wbr_ Autocapitalize  String  where
  attr Autocapitalize value = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: prop' value }
instance Attr Wbr_ Autocapitalize (Event.Event  String ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr Wbr_ Autocapitalize (ST.ST Global.Global  String ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "autocapitalize", value: prop' value }

instance Attr everything Autocapitalize (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Autocapitalize bothValues = unsafeAttribute $ Both (pure 
    { key: "autocapitalize", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "autocapitalize", value: unset' })
instance Attr everything Autocapitalize (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Autocapitalize (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "autocapitalize", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "autocapitalize", value: unset' })
instance Attr everything Autocapitalize  Unit  where
  attr Autocapitalize _ = unsafeAttribute $ This $ pure $
    { key: "autocapitalize", value: unset' }
instance Attr everything Autocapitalize (Event.Event  Unit ) where
  attr Autocapitalize eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "autocapitalize", value: unset' }

instance Attr everything Autocapitalize (ST.ST Global.Global  Unit ) where
  attr Autocapitalize stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "autocapitalize", value: unset' }
