module Deku.DOM.Attr.LightingColor where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Image (Image_)
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
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data LightingColor = LightingColor

instance Attr FeBlend_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeBlend_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeBlend_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeBlend_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeBlend_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeColorMatrix_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeColorMatrix_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeColorMatrix_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeColorMatrix_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeColorMatrix_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeComponentTransfer_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeComponentTransfer_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeComponentTransfer_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeComponentTransfer_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeComponentTransfer_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeComposite_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeComposite_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeComposite_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeComposite_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeComposite_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeConvolveMatrix_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeConvolveMatrix_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeConvolveMatrix_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeConvolveMatrix_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeConvolveMatrix_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeDiffuseLighting_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeDiffuseLighting_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeDiffuseLighting_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeDiffuseLighting_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeDiffuseLighting_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeDisplacementMap_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeDisplacementMap_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeDisplacementMap_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeDisplacementMap_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeDisplacementMap_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeFlood_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeFlood_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeFlood_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeFlood_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeFlood_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeGaussianBlur_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeGaussianBlur_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeGaussianBlur_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeGaussianBlur_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeGaussianBlur_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeImage_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeImage_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeImage_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeImage_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeImage_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeMerge_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeMerge_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeMerge_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeMerge_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeMerge_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeMorphology_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeMorphology_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeMorphology_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeMorphology_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeMorphology_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeOffset_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeOffset_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeOffset_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeOffset_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeOffset_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeSpecularLighting_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeSpecularLighting_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeSpecularLighting_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeSpecularLighting_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeSpecularLighting_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeTile_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeTile_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeTile_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeTile_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeTile_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeTurbulence_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeTurbulence_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr FeTurbulence_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr FeTurbulence_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr FeTurbulence_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr Filter_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr Filter_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr Filter_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr Filter_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr Filter_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr Image_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr Image_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr Image_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr Image_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr Image_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr Switch_ LightingColor (NonEmpty.NonEmpty Event.Event  String ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr Switch_ LightingColor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "lighting-color", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "lighting-color", value: prop' value })
instance Attr Switch_ LightingColor  String  where
  attr LightingColor value = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: prop' value }
instance Attr Switch_ LightingColor (Event.Event  String ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lighting-color", value: prop' value }

instance Attr Switch_ LightingColor (ST.ST Global.Global  String ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "lighting-color", value: prop' value }

instance Attr everything LightingColor (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr LightingColor bothValues = unsafeAttribute $ Both (pure 
    { key: "lighting-color", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "lighting-color", value: unset' })
instance Attr everything LightingColor (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr LightingColor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "lighting-color", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "lighting-color", value: unset' })
instance Attr everything LightingColor  Unit  where
  attr LightingColor _ = unsafeAttribute $ This $ pure $
    { key: "lighting-color", value: unset' }
instance Attr everything LightingColor (Event.Event  Unit ) where
  attr LightingColor eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "lighting-color", value: unset' }

instance Attr everything LightingColor (ST.ST Global.Global  Unit ) where
  attr LightingColor iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "lighting-color", value: unset' }
