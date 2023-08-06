module Deku.DOM.Attr.TextAnchor where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
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

data TextAnchor = TextAnchor

instance Attr FeBlend_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeBlend_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeBlend_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeBlend_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeBlend_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeColorMatrix_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeColorMatrix_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeColorMatrix_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeColorMatrix_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeColorMatrix_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeComponentTransfer_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeComponentTransfer_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeComponentTransfer_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeComponentTransfer_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeComponentTransfer_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeComposite_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeComposite_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeComposite_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeComposite_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeComposite_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeConvolveMatrix_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeConvolveMatrix_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeConvolveMatrix_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeConvolveMatrix_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeConvolveMatrix_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeDiffuseLighting_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeDiffuseLighting_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeDiffuseLighting_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeDiffuseLighting_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeDiffuseLighting_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeDisplacementMap_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeDisplacementMap_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeDisplacementMap_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeDisplacementMap_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeDisplacementMap_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeFlood_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeFlood_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeFlood_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeFlood_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeFlood_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeGaussianBlur_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeGaussianBlur_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeGaussianBlur_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeGaussianBlur_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeGaussianBlur_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeImage_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeImage_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeImage_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeImage_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeImage_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeMerge_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeMerge_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeMerge_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeMerge_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeMerge_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeMorphology_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeMorphology_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeMorphology_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeMorphology_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeMorphology_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeOffset_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeOffset_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeOffset_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeOffset_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeOffset_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeSpecularLighting_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeSpecularLighting_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeSpecularLighting_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeSpecularLighting_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeSpecularLighting_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeTile_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeTile_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeTile_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeTile_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeTile_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeTurbulence_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeTurbulence_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr FeTurbulence_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr FeTurbulence_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr FeTurbulence_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr Filter_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr Filter_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr Filter_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr Filter_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr Filter_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr Image_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr Image_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr Image_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr Image_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr Image_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr Switch_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr Switch_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr Switch_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr Switch_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr Switch_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr Text_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr Text_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr Text_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr Text_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr Text_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr Tspan_ TextAnchor (NonEmpty.NonEmpty Event.Event  String ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr Tspan_ TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "text-anchor", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "text-anchor", value: prop' value })
instance Attr Tspan_ TextAnchor  String  where
  attr TextAnchor value = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: prop' value }
instance Attr Tspan_ TextAnchor (Event.Event  String ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "text-anchor", value: prop' value }

instance Attr Tspan_ TextAnchor (ST.ST Global.Global  String ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "text-anchor", value: prop' value }

instance Attr everything TextAnchor (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr TextAnchor bothValues = unsafeAttribute $ Both (pure 
    { key: "text-anchor", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "text-anchor", value: unset' })
instance Attr everything TextAnchor (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr TextAnchor (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "text-anchor", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "text-anchor", value: unset' })
instance Attr everything TextAnchor  Unit  where
  attr TextAnchor _ = unsafeAttribute $ This $ pure $
    { key: "text-anchor", value: unset' }
instance Attr everything TextAnchor (Event.Event  Unit ) where
  attr TextAnchor eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "text-anchor", value: unset' }

instance Attr everything TextAnchor (ST.ST Global.Global  Unit ) where
  attr TextAnchor iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "text-anchor", value: unset' }
