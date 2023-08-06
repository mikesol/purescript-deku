module Deku.DOM.Attr.XmlLang where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Metadata (Metadata_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMergeNode (FeMergeNode_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data XmlLang = XmlLang

instance Attr AnimateTransform_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr AnimateTransform_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr AnimateTransform_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr AnimateTransform_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr AnimateTransform_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Discard_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Discard_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Discard_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr Discard_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Discard_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeBlend_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeBlend_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeBlend_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeBlend_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeBlend_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeColorMatrix_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeColorMatrix_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeColorMatrix_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeColorMatrix_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeColorMatrix_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeComponentTransfer_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeComponentTransfer_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeComponentTransfer_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeComponentTransfer_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeComponentTransfer_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeComposite_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeComposite_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeComposite_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeComposite_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeComposite_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeConvolveMatrix_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeConvolveMatrix_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeConvolveMatrix_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeConvolveMatrix_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeConvolveMatrix_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeDiffuseLighting_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeDiffuseLighting_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeDiffuseLighting_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeDiffuseLighting_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeDiffuseLighting_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeDisplacementMap_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeDisplacementMap_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeDisplacementMap_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeDisplacementMap_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeDisplacementMap_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeDistantLight_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeDistantLight_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeDistantLight_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeDistantLight_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeDistantLight_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeFlood_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeFlood_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeFlood_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeFlood_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeFlood_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeFuncA_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeFuncA_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeFuncA_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeFuncA_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeFuncA_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeFuncB_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeFuncB_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeFuncB_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeFuncB_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeFuncB_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeFuncG_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeFuncG_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeFuncG_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeFuncG_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeFuncG_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeFuncR_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeFuncR_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeFuncR_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeFuncR_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeFuncR_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeGaussianBlur_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeGaussianBlur_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeGaussianBlur_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeGaussianBlur_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeGaussianBlur_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeImage_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeImage_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeImage_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeImage_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeImage_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeMerge_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeMerge_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeMerge_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeMerge_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeMerge_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeMergeNode_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeMergeNode_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeMergeNode_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeMergeNode_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeMergeNode_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeMorphology_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeMorphology_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeMorphology_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeMorphology_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeMorphology_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeOffset_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeOffset_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeOffset_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeOffset_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeOffset_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FePointLight_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FePointLight_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FePointLight_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FePointLight_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FePointLight_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeSpecularLighting_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeSpecularLighting_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeSpecularLighting_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeSpecularLighting_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeSpecularLighting_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeSpotLight_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeSpotLight_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeSpotLight_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeSpotLight_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeSpotLight_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeTile_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeTile_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeTile_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeTile_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeTile_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeTurbulence_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeTurbulence_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr FeTurbulence_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr FeTurbulence_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr FeTurbulence_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Filter_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Filter_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Filter_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr Filter_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Filter_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Image_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Image_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Image_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr Image_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Image_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Metadata_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Metadata_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Metadata_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr Metadata_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Metadata_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Mpath_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Mpath_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Mpath_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr Mpath_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Mpath_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Switch_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Switch_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr Switch_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr Switch_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr Switch_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr View_ XmlLang (NonEmpty.NonEmpty Event.Event  String ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr View_ XmlLang (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "xml:lang", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "xml:lang", value: prop' value })
instance Attr View_ XmlLang  String  where
  attr XmlLang value = unsafeAttribute $ This $ pure $
    { key: "xml:lang", value: prop' value }
instance Attr View_ XmlLang (Event.Event  String ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "xml:lang", value: prop' value }

instance Attr View_ XmlLang (ST.ST Global.Global  String ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "xml:lang", value: prop' value }

instance Attr everything XmlLang (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr XmlLang bothValues = unsafeAttribute $ Both (pure 
    { key: "xml:lang", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "xml:lang", value: unset' })
instance Attr everything XmlLang (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr XmlLang (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "xml:lang", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "xml:lang", value: unset' })
instance Attr everything XmlLang  Unit  where
  attr XmlLang _ = unsafeAttribute $ This $ { key: "xml:lang", value: unset' }
instance Attr everything XmlLang (Event.Event  Unit ) where
  attr XmlLang eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "xml:lang", value: unset' }

instance Attr everything XmlLang (ST.ST Global.Global  Unit ) where
  attr XmlLang iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "xml:lang", value: unset' }
