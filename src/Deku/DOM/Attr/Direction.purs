module Deku.DOM.Attr.Direction where

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

data Direction = Direction

instance Attr FeBlend_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeBlend_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeBlend_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeBlend_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeBlend_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeColorMatrix_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeColorMatrix_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeColorMatrix_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeColorMatrix_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeColorMatrix_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeComponentTransfer_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeComponentTransfer_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeComponentTransfer_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeComponentTransfer_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeComponentTransfer_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeComposite_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeComposite_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeComposite_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeComposite_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeComposite_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeConvolveMatrix_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeConvolveMatrix_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeConvolveMatrix_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeConvolveMatrix_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeConvolveMatrix_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeDiffuseLighting_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeDiffuseLighting_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeDiffuseLighting_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeDiffuseLighting_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeDiffuseLighting_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeDisplacementMap_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeDisplacementMap_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeDisplacementMap_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeDisplacementMap_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeDisplacementMap_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeFlood_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeFlood_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeFlood_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeFlood_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeFlood_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeGaussianBlur_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeGaussianBlur_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeGaussianBlur_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeGaussianBlur_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeGaussianBlur_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeImage_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeImage_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeImage_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeImage_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeImage_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeMerge_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeMerge_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeMerge_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeMerge_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeMerge_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeMorphology_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeMorphology_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeMorphology_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeMorphology_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeMorphology_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeOffset_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeOffset_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeOffset_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeOffset_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeOffset_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeSpecularLighting_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeSpecularLighting_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeSpecularLighting_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeSpecularLighting_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeSpecularLighting_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeTile_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeTile_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeTile_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeTile_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeTile_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr FeTurbulence_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeTurbulence_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr FeTurbulence_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr FeTurbulence_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr FeTurbulence_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr Filter_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr Filter_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr Filter_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr Filter_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr Filter_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr Image_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr Image_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr Image_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr Image_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr Image_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr Switch_ Direction (NonEmpty.NonEmpty Event.Event  String ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr Switch_ Direction (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "direction", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "direction", value: prop' value })
instance Attr Switch_ Direction  String  where
  attr Direction value = unsafeAttribute $ This $ pure $
    { key: "direction", value: prop' value }
instance Attr Switch_ Direction (Event.Event  String ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "direction", value: prop' value }

instance Attr Switch_ Direction (ST.ST Global.Global  String ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "direction", value: prop' value }

instance Attr everything Direction (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Direction bothValues = unsafeAttribute $ Both (pure 
    { key: "direction", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "direction", value: unset' })
instance Attr everything Direction (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Direction (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "direction", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "direction", value: unset' })
instance Attr everything Direction  Unit  where
  attr Direction _ = unsafeAttribute $ This $ pure $
    { key: "direction", value: unset' }
instance Attr everything Direction (Event.Event  Unit ) where
  attr Direction eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "direction", value: unset' }

instance Attr everything Direction (ST.ST Global.Global  Unit ) where
  attr Direction iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "direction", value: unset' }
