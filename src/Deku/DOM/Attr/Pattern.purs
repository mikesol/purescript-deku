module Deku.DOM.Attr.Pattern where

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

data Pattern = Pattern

instance Attr Input_ Pattern (NonEmpty.NonEmpty Event.Event  String ) where
  attr Pattern bothValues = unsafeAttribute $ Both (pure 
    { key: "pattern", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pattern", value: prop' value })
instance Attr Input_ Pattern (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Pattern (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "pattern", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "pattern", value: prop' value })
instance Attr Input_ Pattern  String  where
  attr Pattern value = unsafeAttribute $ This $ pure $
    { key: "pattern", value: prop' value }
instance Attr Input_ Pattern (Event.Event  String ) where
  attr Pattern eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pattern", value: prop' value }

instance Attr Input_ Pattern (ST.ST Global.Global  String ) where
  attr Pattern stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "pattern", value: prop' value }

instance Attr everything Pattern (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Pattern bothValues = unsafeAttribute $ Both (pure 
    { key: "pattern", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pattern", value: unset' })
instance Attr everything Pattern (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Pattern (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "pattern", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pattern", value: unset' })
instance Attr everything Pattern  Unit  where
  attr Pattern _ = unsafeAttribute $ This $ pure $ { key: "pattern", value: unset' }
instance Attr everything Pattern (Event.Event  Unit ) where
  attr Pattern eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "pattern", value: unset' }

instance Attr everything Pattern (ST.ST Global.Global  Unit ) where
  attr Pattern stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "pattern", value: unset' }
