module Deku.DOM.Attr.Selected where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Option (Option_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Selected = Selected

instance Attr Option_ Selected (NonEmpty.NonEmpty Event.Event  String ) where
  attr Selected bothValues = unsafeAttribute $ Both (pure 
    { key: "selected", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "selected", value: prop' value })
instance Attr Option_ Selected (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Selected (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "selected", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "selected", value: prop' value })
instance Attr Option_ Selected  String  where
  attr Selected value = unsafeAttribute $ This $ pure $
    { key: "selected", value: prop' value }
instance Attr Option_ Selected (Event.Event  String ) where
  attr Selected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selected", value: prop' value }

instance Attr Option_ Selected (ST.ST Global.Global  String ) where
  attr Selected iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "selected", value: prop' value }

instance Attr everything Selected (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Selected bothValues = unsafeAttribute $ Both (pure 
    { key: "selected", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "selected", value: unset' })
instance Attr everything Selected (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Selected (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "selected", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "selected", value: unset' })
instance Attr everything Selected  Unit  where
  attr Selected _ = unsafeAttribute $ This $ pure $
    { key: "selected", value: unset' }
instance Attr everything Selected (Event.Event  Unit ) where
  attr Selected eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "selected", value: unset' }

instance Attr everything Selected (ST.ST Global.Global  Unit ) where
  attr Selected iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "selected", value: unset' }
