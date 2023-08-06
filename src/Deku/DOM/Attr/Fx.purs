module Deku.DOM.Attr.Fx where

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

data Fx = Fx

instance Attr RadialGradient_ Fx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Fx bothValues = unsafeAttribute $ Both (pure 
    { key: "fx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "fx", value: prop' value })
instance Attr RadialGradient_ Fx (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Fx (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "fx", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "fx", value: prop' value })
instance Attr RadialGradient_ Fx  String  where
  attr Fx value = unsafeAttribute $ This $ { key: "fx", value: prop' value }
instance Attr RadialGradient_ Fx (Event.Event  String ) where
  attr Fx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "fx", value: prop' value }

instance Attr RadialGradient_ Fx (ST.ST Global.Global  String ) where
  attr Fx iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "fx", value: prop' value }

instance Attr everything Fx (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Fx bothValues = unsafeAttribute $ Both (pure  { key: "fx", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "fx", value: unset' })
instance Attr everything Fx (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Fx (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "fx", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "fx", value: unset' })
instance Attr everything Fx  Unit  where
  attr Fx _ = unsafeAttribute $ This $ { key: "fx", value: unset' }
instance Attr everything Fx (Event.Event  Unit ) where
  attr Fx eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "fx", value: unset' }

instance Attr everything Fx (ST.ST Global.Global  Unit ) where
  attr Fx iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "fx", value: unset' }
