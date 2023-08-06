module Deku.DOM.Attr.StopOpacity where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Stop (Stop_)
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

data StopOpacity = StopOpacity

instance Attr FeBlend_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeBlend_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeBlend_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeBlend_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeBlend_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeColorMatrix_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeColorMatrix_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeColorMatrix_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeColorMatrix_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeColorMatrix_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeComponentTransfer_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeComponentTransfer_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeComponentTransfer_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeComponentTransfer_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeComponentTransfer_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeComposite_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeComposite_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeComposite_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeComposite_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeComposite_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeConvolveMatrix_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeConvolveMatrix_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeConvolveMatrix_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeDiffuseLighting_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeDiffuseLighting_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeDiffuseLighting_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeDisplacementMap_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeDisplacementMap_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeDisplacementMap_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeDisplacementMap_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeDisplacementMap_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeFlood_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeFlood_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeFlood_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeFlood_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeFlood_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeGaussianBlur_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeGaussianBlur_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeGaussianBlur_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeGaussianBlur_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeGaussianBlur_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeImage_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeImage_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeImage_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeImage_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeImage_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeMerge_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeMerge_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeMerge_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeMerge_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeMerge_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeMorphology_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeMorphology_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeMorphology_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeMorphology_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeMorphology_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeOffset_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeOffset_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeOffset_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeOffset_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeOffset_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeSpecularLighting_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeSpecularLighting_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeSpecularLighting_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeSpecularLighting_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeSpecularLighting_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeTile_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeTile_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeTile_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeTile_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeTile_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeTurbulence_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeTurbulence_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr FeTurbulence_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr FeTurbulence_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr FeTurbulence_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr Filter_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr Filter_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr Filter_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr Filter_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr Filter_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr Image_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr Image_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr Image_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr Image_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr Image_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr Stop_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr Stop_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr Stop_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr Stop_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr Stop_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr Switch_ StopOpacity (NonEmpty.NonEmpty Event.Event  String ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr Switch_ StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "stop-opacity", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "stop-opacity", value: prop' value })
instance Attr Switch_ StopOpacity  String  where
  attr StopOpacity value = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: prop' value }
instance Attr Switch_ StopOpacity (Event.Event  String ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr Switch_ StopOpacity (ST.ST Global.Global  String ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "stop-opacity", value: prop' value }

instance Attr everything StopOpacity (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StopOpacity bothValues = unsafeAttribute $ Both (pure 
    { key: "stop-opacity", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "stop-opacity", value: unset' })
instance Attr everything StopOpacity (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr StopOpacity (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "stop-opacity", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "stop-opacity", value: unset' })
instance Attr everything StopOpacity  Unit  where
  attr StopOpacity _ = unsafeAttribute $ This $ pure $
    { key: "stop-opacity", value: unset' }
instance Attr everything StopOpacity (Event.Event  Unit ) where
  attr StopOpacity eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "stop-opacity", value: unset' }

instance Attr everything StopOpacity (ST.ST Global.Global  Unit ) where
  attr StopOpacity iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "stop-opacity", value: unset' }
