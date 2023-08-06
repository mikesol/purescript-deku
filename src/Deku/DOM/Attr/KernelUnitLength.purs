module Deku.DOM.Attr.KernelUnitLength where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KernelUnitLength = KernelUnitLength

instance Attr FeConvolveMatrix_ KernelUnitLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both (pure 
    { key: "kernelUnitLength", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
instance Attr FeConvolveMatrix_ KernelUnitLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KernelUnitLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "kernelUnitLength", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
instance Attr FeConvolveMatrix_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute $ This $ pure $
    { key: "kernelUnitLength", value: prop' value }
instance Attr FeConvolveMatrix_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr FeConvolveMatrix_ KernelUnitLength (ST.ST Global.Global  String ) where
  attr KernelUnitLength iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr FeDiffuseLighting_ KernelUnitLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both (pure 
    { key: "kernelUnitLength", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
instance Attr FeDiffuseLighting_ KernelUnitLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KernelUnitLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "kernelUnitLength", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
instance Attr FeDiffuseLighting_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute $ This $ pure $
    { key: "kernelUnitLength", value: prop' value }
instance Attr FeDiffuseLighting_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr FeDiffuseLighting_ KernelUnitLength (ST.ST Global.Global  String ) where
  attr KernelUnitLength iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr FeSpecularLighting_ KernelUnitLength (NonEmpty.NonEmpty Event.Event  String ) where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both (pure 
    { key: "kernelUnitLength", value: prop' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
instance Attr FeSpecularLighting_ KernelUnitLength (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KernelUnitLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "kernelUnitLength", value: prop' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "kernelUnitLength", value: prop' value }
    )
instance Attr FeSpecularLighting_ KernelUnitLength  String  where
  attr KernelUnitLength value = unsafeAttribute $ This $ pure $
    { key: "kernelUnitLength", value: prop' value }
instance Attr FeSpecularLighting_ KernelUnitLength (Event.Event  String ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr FeSpecularLighting_ KernelUnitLength (ST.ST Global.Global  String ) where
  attr KernelUnitLength iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "kernelUnitLength", value: prop' value }

instance Attr everything KernelUnitLength (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr KernelUnitLength bothValues = unsafeAttribute $ Both (pure 
    { key: "kernelUnitLength", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "kernelUnitLength", value: unset' })
instance Attr everything KernelUnitLength (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr KernelUnitLength (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "kernelUnitLength", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "kernelUnitLength", value: unset' })
instance Attr everything KernelUnitLength  Unit  where
  attr KernelUnitLength _ = unsafeAttribute $ This $ pure $
    { key: "kernelUnitLength", value: unset' }
instance Attr everything KernelUnitLength (Event.Event  Unit ) where
  attr KernelUnitLength eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "kernelUnitLength", value: unset' }

instance Attr everything KernelUnitLength (ST.ST Global.Global  Unit ) where
  attr KernelUnitLength iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "kernelUnitLength", value: unset' }
