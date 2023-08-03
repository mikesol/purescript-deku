module Deku.DOM.Attr.Scale where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scale = Scale

instance Attr FeDisplacementMap_ Scale (NonEmpty.NonEmpty Event.Event  String ) where
  attr Scale bothValues = unsafeAttribute $ Both (pure 
    { key: "scale", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "scale", value: prop' value })
instance Attr FeDisplacementMap_ Scale (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Scale (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "scale", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "scale", value: prop' value })
instance Attr FeDisplacementMap_ Scale  String  where
  attr Scale value = unsafeAttribute $ This $ pure $
    { key: "scale", value: prop' value }
instance Attr FeDisplacementMap_ Scale (Event.Event  String ) where
  attr Scale eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scale", value: prop' value }

instance Attr FeDisplacementMap_ Scale (ST.ST Global.Global  String ) where
  attr Scale stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "scale", value: prop' value }

instance Attr everything Scale (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Scale bothValues = unsafeAttribute $ Both (pure  { key: "scale", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "scale", value: unset' })
instance Attr everything Scale (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Scale (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "scale", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "scale", value: unset' })
instance Attr everything Scale  Unit  where
  attr Scale _ = unsafeAttribute $ This $ pure $ { key: "scale", value: unset' }
instance Attr everything Scale (Event.Event  Unit ) where
  attr Scale eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "scale", value: unset' }

instance Attr everything Scale (ST.ST Global.Global  Unit ) where
  attr Scale stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "scale", value: unset' }
