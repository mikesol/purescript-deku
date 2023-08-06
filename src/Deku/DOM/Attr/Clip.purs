module Deku.DOM.Attr.Clip where

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

data Clip = Clip

instance Attr FeBlend_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeBlend_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeBlend_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeBlend_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeBlend_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeColorMatrix_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeColorMatrix_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeColorMatrix_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeColorMatrix_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeColorMatrix_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeComponentTransfer_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeComponentTransfer_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeComponentTransfer_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeComponentTransfer_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeComponentTransfer_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeComposite_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeComposite_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeComposite_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeComposite_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeComposite_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeConvolveMatrix_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeConvolveMatrix_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeConvolveMatrix_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeConvolveMatrix_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeConvolveMatrix_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeDiffuseLighting_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeDiffuseLighting_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeDiffuseLighting_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeDiffuseLighting_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeDiffuseLighting_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeDisplacementMap_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeDisplacementMap_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeDisplacementMap_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeDisplacementMap_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeDisplacementMap_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeFlood_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeFlood_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeFlood_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeFlood_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeFlood_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeGaussianBlur_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeGaussianBlur_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeGaussianBlur_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeGaussianBlur_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeGaussianBlur_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeImage_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeImage_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeImage_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeImage_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeImage_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeMerge_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeMerge_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeMerge_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeMerge_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeMerge_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeMorphology_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeMorphology_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeMorphology_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeMorphology_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeMorphology_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeOffset_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeOffset_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeOffset_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeOffset_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeOffset_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeSpecularLighting_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeSpecularLighting_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeSpecularLighting_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeSpecularLighting_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeSpecularLighting_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeTile_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeTile_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeTile_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeTile_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeTile_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr FeTurbulence_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeTurbulence_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr FeTurbulence_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr FeTurbulence_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr FeTurbulence_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr Filter_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr Filter_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr Filter_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr Filter_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr Filter_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr Image_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr Image_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr Image_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr Image_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr Image_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr Switch_ Clip (NonEmpty.NonEmpty Event.Event  String ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure 
    { key: "clip", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr Switch_ Clip (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "clip", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "clip", value: prop' value })
instance Attr Switch_ Clip  String  where
  attr Clip value = unsafeAttribute $ This $ pure $
    { key: "clip", value: prop' value }
instance Attr Switch_ Clip (Event.Event  String ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "clip", value: prop' value }

instance Attr Switch_ Clip (ST.ST Global.Global  String ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "clip", value: prop' value }

instance Attr everything Clip (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Clip bothValues = unsafeAttribute $ Both (pure  { key: "clip", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "clip", value: unset' })
instance Attr everything Clip (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Clip (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "clip", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "clip", value: unset' })
instance Attr everything Clip  Unit  where
  attr Clip _ = unsafeAttribute $ This $ { key: "clip", value: unset' }
instance Attr everything Clip (Event.Event  Unit ) where
  attr Clip eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "clip", value: unset' }

instance Attr everything Clip (ST.ST Global.Global  Unit ) where
  attr Clip iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "clip", value: unset' }
