module Deku.DOM.Attr.Keytype where

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

data Keytype = Keytype

instance Attr A_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr A_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr A_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr A_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr A_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Abbr_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Abbr_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Abbr_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Abbr_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Abbr_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Acronym_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Acronym_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Acronym_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Acronym_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Acronym_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Address_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Address_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Address_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Address_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Address_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Applet_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Applet_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Applet_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Applet_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Applet_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Area_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Area_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Area_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Area_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Area_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Article_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Article_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Article_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Article_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Article_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Aside_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Aside_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Aside_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Aside_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Aside_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Audio_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Audio_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Audio_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Audio_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Audio_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr B_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr B_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr B_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr B_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr B_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Base_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Base_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Base_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Base_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Base_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Basefont_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Basefont_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Basefont_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Basefont_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Basefont_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Bdi_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Bdi_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Bdi_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Bdi_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Bdi_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Bdo_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Bdo_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Bdo_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Bdo_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Bdo_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Big_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Big_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Big_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Big_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Big_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Blockquote_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Blockquote_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Blockquote_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Blockquote_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Blockquote_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Body_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Body_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Body_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Body_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Body_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Br_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Br_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Br_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Br_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Br_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Button_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Button_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Button_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Button_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Button_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Canvas_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Canvas_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Canvas_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Canvas_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Canvas_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Caption_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Caption_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Caption_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Caption_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Caption_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Center_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Center_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Center_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Center_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Center_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Cite_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Cite_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Cite_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Cite_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Cite_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Code_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Code_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Code_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Code_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Code_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Col_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Col_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Col_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Col_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Col_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Colgroup_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Colgroup_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Colgroup_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Colgroup_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Colgroup_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Xdata_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Xdata_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Xdata_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Xdata_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Xdata_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Datalist_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Datalist_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Datalist_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Datalist_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Datalist_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dd_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dd_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dd_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Dd_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dd_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Del_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Del_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Del_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Del_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Del_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Details_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Details_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Details_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Details_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Details_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dfn_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dfn_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dfn_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Dfn_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dfn_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dialog_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dialog_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dialog_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Dialog_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dialog_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dir_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dir_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dir_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Dir_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dir_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Div_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Div_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Div_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Div_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Div_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dl_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dl_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dl_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Dl_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dl_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dt_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dt_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Dt_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Dt_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Dt_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Em_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Em_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Em_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Em_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Em_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Embed_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Embed_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Embed_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Embed_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Embed_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Fieldset_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Fieldset_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Fieldset_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Fieldset_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Fieldset_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Figcaption_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Figcaption_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Figcaption_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Figcaption_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Figcaption_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Figure_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Figure_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Figure_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Figure_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Figure_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Font_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Font_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Font_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Font_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Font_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Footer_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Footer_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Footer_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Footer_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Footer_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Form_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Form_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Form_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Form_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Form_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Frame_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Frame_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Frame_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Frame_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Frame_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Frameset_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Frameset_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Frameset_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Frameset_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Frameset_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H1_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H1_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H1_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr H1_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H1_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H2_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H2_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H2_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr H2_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H2_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H3_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H3_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H3_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr H3_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H3_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H4_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H4_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H4_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr H4_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H4_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H5_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H5_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H5_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr H5_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H5_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H6_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H6_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr H6_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr H6_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr H6_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Head_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Head_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Head_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Head_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Head_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Header_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Header_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Header_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Header_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Header_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Hr_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Hr_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Hr_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Hr_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Hr_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Html_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Html_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Html_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Html_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Html_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr I_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr I_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr I_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr I_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr I_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Iframe_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Iframe_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Iframe_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Iframe_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Iframe_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Img_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Img_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Img_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Img_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Img_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Input_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Input_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Input_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Input_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Input_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Ins_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Ins_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Ins_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Ins_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Ins_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Kbd_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Kbd_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Kbd_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Kbd_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Kbd_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Label_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Label_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Label_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Label_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Label_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Legend_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Legend_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Legend_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Legend_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Legend_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Li_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Li_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Li_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Li_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Li_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Link_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Link_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Link_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Link_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Link_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Main_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Main_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Main_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Main_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Main_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Map_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Map_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Map_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Map_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Map_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Mark_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Mark_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Mark_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Mark_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Mark_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Meta_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Meta_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Meta_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Meta_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Meta_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Meter_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Meter_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Meter_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Meter_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Meter_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Nav_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Nav_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Nav_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Nav_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Nav_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Noframes_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Noframes_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Noframes_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Noframes_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Noframes_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Noscript_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Noscript_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Noscript_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Noscript_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Noscript_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Object_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Object_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Object_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Object_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Object_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Ol_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Ol_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Ol_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Ol_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Ol_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Optgroup_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Optgroup_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Optgroup_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Optgroup_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Optgroup_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Option_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Option_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Option_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Option_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Option_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Output_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Output_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Output_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Output_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Output_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr P_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr P_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr P_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr P_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr P_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Param_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Param_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Param_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Param_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Param_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Picture_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Picture_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Picture_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Picture_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Picture_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Pre_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Pre_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Pre_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Pre_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Pre_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Progress_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Progress_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Progress_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Progress_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Progress_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Q_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Q_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Q_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Q_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Q_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Rp_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Rp_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Rp_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Rp_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Rp_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Rt_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Rt_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Rt_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Rt_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Rt_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Ruby_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Ruby_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Ruby_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Ruby_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Ruby_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr S_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr S_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr S_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr S_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr S_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Samp_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Samp_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Samp_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Samp_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Samp_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Script_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Script_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Script_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Script_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Script_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Section_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Section_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Section_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Section_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Section_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Select_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Select_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Select_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Select_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Select_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Small_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Small_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Small_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Small_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Small_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Source_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Source_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Source_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Source_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Source_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Span_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Span_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Span_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Span_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Span_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Strike_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Strike_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Strike_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Strike_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Strike_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Strong_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Strong_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Strong_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Strong_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Strong_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Style_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Style_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Style_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Style_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Style_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Sub_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Sub_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Sub_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Sub_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Sub_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Summary_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Summary_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Summary_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Summary_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Summary_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Sup_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Sup_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Sup_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Sup_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Sup_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Svg_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Svg_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Svg_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Svg_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Svg_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Table_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Table_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Table_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Table_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Table_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Tbody_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Tbody_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Tbody_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Tbody_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Tbody_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Td_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Td_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Td_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Td_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Td_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Template_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Template_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Template_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Template_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Template_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Textarea_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Textarea_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Textarea_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Textarea_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Textarea_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Tfoot_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Tfoot_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Tfoot_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Tfoot_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Tfoot_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Th_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Th_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Th_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Th_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Th_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Thead_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Thead_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Thead_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Thead_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Thead_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Time_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Time_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Time_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Time_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Time_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Title_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Title_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Title_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Title_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Title_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Tr_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Tr_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Tr_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Tr_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Tr_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Track_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Track_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Track_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Track_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Track_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Tt_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Tt_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Tt_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Tt_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Tt_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr U_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr U_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr U_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr U_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr U_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Ul_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Ul_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Ul_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Ul_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Ul_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Var_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Var_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Var_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Var_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Var_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Video_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Video_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Video_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Video_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Video_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Wbr_ Keytype (NonEmpty.NonEmpty Event.Event  String ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Wbr_ Keytype (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "keytype", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keytype", value: prop' value })
instance Attr Wbr_ Keytype  String  where
  attr Keytype value = unsafeAttribute $ This $ pure $
    { key: "keytype", value: prop' value }
instance Attr Wbr_ Keytype (Event.Event  String ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr Wbr_ Keytype (ST.ST Global.Global  String ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "keytype", value: prop' value }

instance Attr everything Keytype (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Keytype bothValues = unsafeAttribute $ Both (pure 
    { key: "keytype", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "keytype", value: unset' })
instance Attr everything Keytype (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Keytype (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "keytype", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "keytype", value: unset' })
instance Attr everything Keytype  Unit  where
  attr Keytype _ = unsafeAttribute $ This $ pure $ { key: "keytype", value: unset' }
instance Attr everything Keytype (Event.Event  Unit ) where
  attr Keytype eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "keytype", value: unset' }

instance Attr everything Keytype (ST.ST Global.Global  Unit ) where
  attr Keytype stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "keytype", value: unset' }
