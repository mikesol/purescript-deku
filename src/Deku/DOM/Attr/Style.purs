module Deku.DOM.Attr.Style where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Title (Title_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Desc (Desc_)
import Deku.DOM.Elt.Defs (Defs_)
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
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
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Template (Template_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Thead (Thead_)
import Deku.DOM.Elt.Time (Time_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Tt (Tt_)
import Deku.DOM.Elt.U (U_)
import Deku.DOM.Elt.Ul (Ul_)
import Deku.DOM.Elt.Var (Var_)
import Deku.DOM.Elt.Video (Video_)
import Deku.DOM.Elt.Wbr (Wbr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Style = Style

instance Attr A_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr A_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr A_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr A_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr A_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Abbr_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Abbr_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Abbr_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Abbr_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Abbr_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Acronym_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Acronym_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Acronym_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Acronym_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Acronym_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Address_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Address_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Address_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Address_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Address_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Applet_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Applet_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Applet_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Applet_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Applet_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Area_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Area_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Area_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Area_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Area_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Article_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Article_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Article_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Article_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Article_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Aside_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Aside_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Aside_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Aside_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Aside_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Audio_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Audio_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Audio_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Audio_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Audio_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr B_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr B_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr B_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr B_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr B_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Base_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Base_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Base_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Base_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Base_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Basefont_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Basefont_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Basefont_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Basefont_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Basefont_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Bdi_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Bdi_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Bdi_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Bdi_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Bdi_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Bdo_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Bdo_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Bdo_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Bdo_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Bdo_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Big_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Big_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Big_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Big_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Big_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Blockquote_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Blockquote_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Blockquote_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Blockquote_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Blockquote_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Body_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Body_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Body_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Body_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Body_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Br_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Br_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Br_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Br_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Br_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Button_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Button_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Button_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Button_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Button_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Canvas_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Canvas_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Canvas_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Canvas_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Canvas_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Caption_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Caption_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Caption_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Caption_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Caption_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Center_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Center_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Center_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Center_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Center_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Cite_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Cite_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Cite_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Cite_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Cite_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Code_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Code_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Code_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Code_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Code_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Col_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Col_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Col_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Col_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Col_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Colgroup_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Colgroup_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Colgroup_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Colgroup_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Colgroup_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Xdata_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Xdata_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Xdata_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Xdata_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Xdata_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Datalist_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Datalist_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Datalist_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Datalist_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Datalist_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dd_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dd_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dd_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Dd_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dd_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Del_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Del_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Del_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Del_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Del_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Details_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Details_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Details_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Details_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Details_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dfn_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dfn_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dfn_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Dfn_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dfn_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dialog_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dialog_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dialog_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Dialog_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dialog_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dir_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dir_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dir_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Dir_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dir_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Div_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Div_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Div_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Div_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Div_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dl_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dl_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dl_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Dl_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dl_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dt_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dt_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Dt_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Dt_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Dt_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Em_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Em_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Em_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Em_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Em_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Embed_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Embed_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Embed_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Embed_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Embed_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Fieldset_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Fieldset_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Fieldset_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Fieldset_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Fieldset_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Figcaption_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Figcaption_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Figcaption_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Figcaption_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Figcaption_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Figure_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Figure_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Figure_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Figure_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Figure_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Font_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Font_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Font_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Font_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Font_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Footer_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Footer_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Footer_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Footer_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Footer_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Form_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Form_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Form_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Form_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Form_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Frame_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Frame_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Frame_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Frame_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Frame_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Frameset_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Frameset_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Frameset_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Frameset_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Frameset_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H1_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H1_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H1_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr H1_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H1_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H2_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H2_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H2_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr H2_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H2_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H3_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H3_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H3_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr H3_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H3_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H4_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H4_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H4_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr H4_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H4_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H5_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H5_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H5_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr H5_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H5_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H6_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H6_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr H6_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr H6_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr H6_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Head_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Head_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Head_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Head_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Head_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Header_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Header_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Header_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Header_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Header_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Hr_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Hr_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Hr_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Hr_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Hr_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Html_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Html_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Html_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Html_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Html_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr I_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr I_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr I_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr I_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr I_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Iframe_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Iframe_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Iframe_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Iframe_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Iframe_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Img_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Img_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Img_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Img_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Img_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Input_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Input_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Input_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Input_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Input_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Ins_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Ins_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Ins_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Ins_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Ins_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Kbd_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Kbd_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Kbd_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Kbd_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Kbd_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Label_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Label_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Label_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Label_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Label_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Legend_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Legend_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Legend_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Legend_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Legend_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Li_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Li_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Li_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Li_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Li_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Link_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Link_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Link_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Link_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Link_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Main_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Main_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Main_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Main_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Main_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Map_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Map_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Map_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Map_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Map_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Mark_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Mark_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Mark_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Mark_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Mark_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Meta_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Meta_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Meta_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Meta_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Meta_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Meter_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Meter_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Meter_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Meter_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Meter_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Nav_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Nav_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Nav_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Nav_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Nav_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Noframes_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Noframes_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Noframes_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Noframes_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Noframes_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Noscript_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Noscript_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Noscript_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Noscript_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Noscript_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Object_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Object_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Object_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Object_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Object_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Ol_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Ol_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Ol_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Ol_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Ol_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Optgroup_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Optgroup_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Optgroup_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Optgroup_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Optgroup_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Option_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Option_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Option_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Option_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Option_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Output_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Output_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Output_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Output_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Output_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr P_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr P_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr P_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr P_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr P_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Param_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Param_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Param_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Param_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Param_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Picture_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Picture_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Picture_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Picture_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Picture_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Pre_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Pre_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Pre_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Pre_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Pre_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Progress_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Progress_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Progress_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Progress_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Progress_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Q_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Q_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Q_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Q_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Q_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Rp_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Rp_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Rp_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Rp_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Rp_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Rt_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Rt_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Rt_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Rt_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Rt_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Ruby_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Ruby_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Ruby_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Ruby_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Ruby_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr S_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr S_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr S_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr S_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr S_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Samp_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Samp_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Samp_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Samp_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Samp_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Script_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Script_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Script_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Script_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Script_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Section_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Section_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Section_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Section_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Section_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Select_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Select_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Select_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Select_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Select_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Small_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Small_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Small_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Small_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Small_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Source_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Source_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Source_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Source_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Source_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Span_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Span_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Span_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Span_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Span_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Strike_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Strike_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Strike_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Strike_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Strike_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Strong_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Strong_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Strong_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Strong_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Strong_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Style_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Style_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Style_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Style_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Style_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Sub_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Sub_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Sub_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Sub_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Sub_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Summary_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Summary_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Summary_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Summary_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Summary_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Sup_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Sup_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Sup_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Sup_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Sup_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Svg_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Svg_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Svg_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Svg_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Svg_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Table_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Table_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Table_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Table_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Table_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Tbody_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Tbody_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Tbody_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Tbody_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Tbody_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Td_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Td_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Td_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Td_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Td_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Template_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Template_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Template_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Template_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Template_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Textarea_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Textarea_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Textarea_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Textarea_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Textarea_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Tfoot_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Tfoot_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Tfoot_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Tfoot_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Tfoot_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Th_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Th_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Th_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Th_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Th_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Thead_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Thead_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Thead_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Thead_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Thead_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Time_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Time_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Time_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Time_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Time_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Title_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Title_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Title_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Title_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Title_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Tr_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Tr_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Tr_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Tr_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Tr_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Track_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Track_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Track_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Track_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Track_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Tt_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Tt_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Tt_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Tt_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Tt_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr U_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr U_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr U_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr U_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr U_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Ul_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Ul_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Ul_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Ul_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Ul_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Var_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Var_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Var_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Var_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Var_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Video_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Video_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Video_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Video_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Video_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Wbr_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Wbr_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Wbr_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Wbr_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Wbr_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Animate_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Animate_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Animate_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Animate_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Animate_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr AnimateMotion_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr AnimateMotion_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr AnimateMotion_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr AnimateMotion_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr AnimateMotion_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Circle_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Circle_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Circle_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Circle_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Circle_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr ClipPath_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr ClipPath_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr ClipPath_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr ClipPath_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr ClipPath_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Defs_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Defs_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Defs_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Defs_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Defs_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Desc_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Desc_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Desc_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Desc_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Desc_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Ellipse_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Ellipse_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Ellipse_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Ellipse_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Ellipse_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeBlend_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeBlend_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeBlend_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeBlend_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeBlend_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeColorMatrix_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeColorMatrix_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeColorMatrix_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeColorMatrix_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeColorMatrix_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeComponentTransfer_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeComponentTransfer_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeComponentTransfer_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeComponentTransfer_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeComponentTransfer_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeComposite_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeComposite_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeComposite_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeComposite_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeComposite_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeConvolveMatrix_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeConvolveMatrix_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeConvolveMatrix_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeConvolveMatrix_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeConvolveMatrix_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeDiffuseLighting_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeDiffuseLighting_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeDiffuseLighting_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeDiffuseLighting_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeDiffuseLighting_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeDisplacementMap_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeDisplacementMap_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeDisplacementMap_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeDisplacementMap_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeDisplacementMap_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeDropShadow_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeDropShadow_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeDropShadow_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeDropShadow_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeDropShadow_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeFlood_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeFlood_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeFlood_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeFlood_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeFlood_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeGaussianBlur_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeGaussianBlur_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeGaussianBlur_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeGaussianBlur_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeGaussianBlur_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeImage_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeImage_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeImage_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeImage_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeImage_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeMerge_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeMerge_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeMerge_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeMerge_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeMerge_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeMorphology_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeMorphology_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeMorphology_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeMorphology_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeMorphology_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeOffset_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeOffset_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeOffset_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeOffset_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeOffset_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeSpecularLighting_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeSpecularLighting_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeSpecularLighting_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeSpecularLighting_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeSpecularLighting_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeTile_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeTile_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeTile_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeTile_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeTile_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeTurbulence_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeTurbulence_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr FeTurbulence_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr FeTurbulence_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr FeTurbulence_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Filter_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Filter_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Filter_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Filter_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Filter_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr ForeignObject_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr ForeignObject_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr ForeignObject_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr ForeignObject_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr ForeignObject_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr G_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr G_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr G_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr G_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr G_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Image_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Image_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Image_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Image_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Image_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Line_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Line_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Line_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Line_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Line_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr LinearGradient_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr LinearGradient_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr LinearGradient_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr LinearGradient_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr LinearGradient_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Marker_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Marker_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Marker_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Marker_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Marker_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Mask_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Mask_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Mask_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Mask_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Mask_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Path_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Path_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Path_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Path_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Path_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Pattern_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Pattern_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Pattern_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Pattern_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Pattern_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Polygon_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Polygon_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Polygon_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Polygon_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Polygon_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Polyline_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Polyline_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Polyline_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Polyline_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Polyline_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr RadialGradient_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr RadialGradient_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr RadialGradient_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr RadialGradient_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr RadialGradient_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Rect_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Rect_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Rect_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Rect_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Rect_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Set_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Set_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Set_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Set_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Set_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Stop_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Stop_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Stop_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Stop_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Stop_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Switch_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Switch_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Switch_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Switch_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Switch_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Symbol_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Symbol_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Symbol_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Symbol_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Symbol_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Text_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Text_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Text_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Text_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Text_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr TextPath_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr TextPath_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr TextPath_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr TextPath_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr TextPath_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Tspan_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Tspan_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Tspan_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Tspan_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Tspan_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Use_ Style (NonEmpty.NonEmpty Event.Event  String ) where
  attr Style bothValues = unsafeAttribute $ Both (pure 
    { key: "style", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Use_ Style (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "style", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "style", value: prop' value })
instance Attr Use_ Style  String  where
  attr Style value = unsafeAttribute $ This $ pure $
    { key: "style", value: prop' value }
instance Attr Use_ Style (Event.Event  String ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr Use_ Style (ST.ST Global.Global  String ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "style", value: prop' value }

instance Attr everything Style (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Style bothValues = unsafeAttribute $ Both (pure  { key: "style", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "style", value: unset' })
instance Attr everything Style (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Style (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "style", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "style", value: unset' })
instance Attr everything Style  Unit  where
  attr Style _ = unsafeAttribute $ This $ pure $ { key: "style", value: unset' }
instance Attr everything Style (Event.Event  Unit ) where
  attr Style eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "style", value: unset' }

instance Attr everything Style (ST.ST Global.Global  Unit ) where
  attr Style stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "style", value: unset' }
