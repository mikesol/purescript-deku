module Deku.DOM.Attr.FontWeight where

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

data FontWeight = FontWeight

instance Attr FeBlend_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeBlend_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeBlend_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeBlend_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeBlend_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeColorMatrix_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeColorMatrix_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeColorMatrix_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeColorMatrix_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeColorMatrix_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeComponentTransfer_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeComponentTransfer_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeComponentTransfer_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeComponentTransfer_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeComponentTransfer_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeComposite_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeComposite_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeComposite_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeComposite_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeComposite_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeConvolveMatrix_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeConvolveMatrix_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeConvolveMatrix_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeConvolveMatrix_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeConvolveMatrix_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeDiffuseLighting_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeDiffuseLighting_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeDiffuseLighting_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeDiffuseLighting_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeDiffuseLighting_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeDisplacementMap_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeDisplacementMap_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeDisplacementMap_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeDisplacementMap_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeDisplacementMap_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeFlood_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeFlood_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeFlood_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeFlood_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeFlood_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeGaussianBlur_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeGaussianBlur_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeGaussianBlur_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeGaussianBlur_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeGaussianBlur_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeImage_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeImage_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeImage_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeImage_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeImage_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeMerge_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeMerge_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeMerge_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeMerge_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeMerge_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeMorphology_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeMorphology_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeMorphology_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeMorphology_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeMorphology_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeOffset_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeOffset_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeOffset_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeOffset_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeOffset_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeSpecularLighting_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeSpecularLighting_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeSpecularLighting_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeSpecularLighting_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeSpecularLighting_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeTile_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeTile_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeTile_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeTile_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeTile_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeTurbulence_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeTurbulence_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr FeTurbulence_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr FeTurbulence_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr FeTurbulence_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr Filter_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr Filter_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr Filter_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr Filter_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr Filter_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr Image_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr Image_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr Image_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr Image_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr Image_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr Switch_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr Switch_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr Switch_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr Switch_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr Switch_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr Text_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr Text_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr Text_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr Text_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr Text_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr Tspan_ FontWeight (NonEmpty.NonEmpty Event.Event  String ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr Tspan_ FontWeight (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "font-weight", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "font-weight", value: prop' value })
instance Attr Tspan_ FontWeight  String  where
  attr FontWeight value = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: prop' value }
instance Attr Tspan_ FontWeight (Event.Event  String ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "font-weight", value: prop' value }

instance Attr Tspan_ FontWeight (ST.ST Global.Global  String ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "font-weight", value: prop' value }

instance Attr everything FontWeight (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr FontWeight bothValues = unsafeAttribute $ Both (pure 
    { key: "font-weight", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "font-weight", value: unset' })
instance Attr everything FontWeight (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr FontWeight (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "font-weight", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "font-weight", value: unset' })
instance Attr everything FontWeight  Unit  where
  attr FontWeight _ = unsafeAttribute $ This $ pure $
    { key: "font-weight", value: unset' }
instance Attr everything FontWeight (Event.Event  Unit ) where
  attr FontWeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "font-weight", value: unset' }

instance Attr everything FontWeight (ST.ST Global.Global  Unit ) where
  attr FontWeight iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "font-weight", value: unset' }
