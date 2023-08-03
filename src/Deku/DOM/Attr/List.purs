module Deku.DOM.Attr.List where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data List = List

instance Attr Input_ List (NonEmpty.NonEmpty Event.Event  String ) where
  attr List bothValues = unsafeAttribute $ Both (pure 
    { key: "list", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "list", value: prop' value })
instance Attr Input_ List (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr List (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "list", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "list", value: prop' value })
instance Attr Input_ List  String  where
  attr List value = unsafeAttribute $ This $ pure $
    { key: "list", value: prop' value }
instance Attr Input_ List (Event.Event  String ) where
  attr List eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "list", value: prop' value }

instance Attr Input_ List (ST.ST Global.Global  String ) where
  attr List stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "list", value: prop' value }

instance Attr everything List (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr List bothValues = unsafeAttribute $ Both (pure  { key: "list", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "list", value: unset' })
instance Attr everything List (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr List (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "list", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "list", value: unset' })
instance Attr everything List  Unit  where
  attr List _ = unsafeAttribute $ This $ pure $ { key: "list", value: unset' }
instance Attr everything List (Event.Event  Unit ) where
  attr List eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "list", value: unset' }

instance Attr everything List (ST.ST Global.Global  Unit ) where
  attr List stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "list", value: unset' }
