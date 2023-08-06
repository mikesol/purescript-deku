module Deku.DOM.Attr.Defer where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Defer = Defer

instance Attr Script_ Defer (NonEmpty.NonEmpty Event.Event  String ) where
  attr Defer bothValues = unsafeAttribute $ Both (pure 
    { key: "defer", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "defer", value: prop' value })
instance Attr Script_ Defer (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Defer (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "defer", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "defer", value: prop' value })
instance Attr Script_ Defer  String  where
  attr Defer value = unsafeAttribute $ This $ pure $
    { key: "defer", value: prop' value }
instance Attr Script_ Defer (Event.Event  String ) where
  attr Defer eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "defer", value: prop' value }

instance Attr Script_ Defer (ST.ST Global.Global  String ) where
  attr Defer iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "defer", value: prop' value }

instance Attr everything Defer (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Defer bothValues = unsafeAttribute $ Both (pure  { key: "defer", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "defer", value: unset' })
instance Attr everything Defer (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Defer (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "defer", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "defer", value: unset' })
instance Attr everything Defer  Unit  where
  attr Defer _ = unsafeAttribute $ This $ { key: "defer", value: unset' }
instance Attr everything Defer (Event.Event  Unit ) where
  attr Defer eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "defer", value: unset' }

instance Attr everything Defer (ST.ST Global.Global  Unit ) where
  attr Defer iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "defer", value: unset' }
