module Deku.DOM.Attr.Fy where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fy = Fy

instance Attr RadialGradient_ Fy (NonEmpty.NonEmpty Event.Event  String ) where
  attr Fy bothValues = unsafeAttribute $ Both (pure 
    { key: "fy", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fy", value: prop' value })
instance Attr RadialGradient_ Fy (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Fy (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "fy", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fy", value: prop' value })
instance Attr RadialGradient_ Fy  String  where
  attr Fy value = unsafeAttribute $ This $ pure $ { key: "fy", value: prop' value }
instance Attr RadialGradient_ Fy (Event.Event  String ) where
  attr Fy eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "fy", value: prop' value }

instance Attr RadialGradient_ Fy (ST.ST Global.Global  String ) where
  attr Fy stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "fy", value: prop' value }

instance Attr everything Fy (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Fy bothValues = unsafeAttribute $ Both (pure  { key: "fy", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "fy", value: unset' })
instance Attr everything Fy (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Fy (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "fy", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "fy", value: unset' })
instance Attr everything Fy  Unit  where
  attr Fy _ = unsafeAttribute $ This $ pure $ { key: "fy", value: unset' }
instance Attr everything Fy (Event.Event  Unit ) where
  attr Fy eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "fy", value: unset' }

instance Attr everything Fy (ST.ST Global.Global  Unit ) where
  attr Fy stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "fy", value: unset' }
