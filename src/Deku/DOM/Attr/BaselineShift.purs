module Deku.DOM.Attr.BaselineShift where

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

data BaselineShift = BaselineShift

instance Attr FeBlend_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeBlend_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeBlend_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeBlend_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeBlend_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeColorMatrix_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeColorMatrix_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeColorMatrix_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeColorMatrix_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeColorMatrix_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeComponentTransfer_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeComponentTransfer_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeComponentTransfer_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeComponentTransfer_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeComponentTransfer_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeComposite_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeComposite_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeComposite_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeComposite_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeComposite_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeConvolveMatrix_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeConvolveMatrix_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeConvolveMatrix_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeConvolveMatrix_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeConvolveMatrix_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeDiffuseLighting_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeDiffuseLighting_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeDiffuseLighting_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeDiffuseLighting_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeDiffuseLighting_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeDisplacementMap_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeDisplacementMap_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeDisplacementMap_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeDisplacementMap_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeDisplacementMap_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeFlood_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeFlood_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeFlood_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeFlood_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeFlood_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeGaussianBlur_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeGaussianBlur_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeGaussianBlur_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeGaussianBlur_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeGaussianBlur_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeImage_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeImage_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeImage_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeImage_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeImage_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeMerge_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeMerge_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeMerge_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeMerge_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeMerge_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeMorphology_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeMorphology_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeMorphology_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeMorphology_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeMorphology_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeOffset_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeOffset_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeOffset_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeOffset_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeOffset_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeSpecularLighting_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeSpecularLighting_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeSpecularLighting_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeSpecularLighting_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeSpecularLighting_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeTile_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeTile_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeTile_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeTile_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeTile_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeTurbulence_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeTurbulence_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr FeTurbulence_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr FeTurbulence_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr FeTurbulence_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr Filter_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr Filter_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr Filter_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr Filter_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr Filter_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr Image_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr Image_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr Image_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr Image_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr Image_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr Switch_ BaselineShift (NonEmpty.NonEmpty Event.Event  String ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr Switch_ BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "baseline-shift", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "baseline-shift", value: prop' value })
instance Attr Switch_ BaselineShift  String  where
  attr BaselineShift value = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: prop' value }
instance Attr Switch_ BaselineShift (Event.Event  String ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr Switch_ BaselineShift (ST.ST Global.Global  String ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "baseline-shift", value: prop' value }

instance Attr everything BaselineShift (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr BaselineShift bothValues = unsafeAttribute $ Both (pure 
    { key: "baseline-shift", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "baseline-shift", value: unset' })
instance Attr everything BaselineShift (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr BaselineShift (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "baseline-shift", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "baseline-shift", value: unset' })
instance Attr everything BaselineShift  Unit  where
  attr BaselineShift _ = unsafeAttribute $ This $ pure $
    { key: "baseline-shift", value: unset' }
instance Attr everything BaselineShift (Event.Event  Unit ) where
  attr BaselineShift eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "baseline-shift", value: unset' }

instance Attr everything BaselineShift (ST.ST Global.Global  Unit ) where
  attr BaselineShift iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "baseline-shift", value: unset' }
