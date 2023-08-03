module Deku.DOM.Attr.Side where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Side = Side

instance Attr TextPath_ Side (NonEmpty.NonEmpty Event.Event  String ) where
  attr Side bothValues = unsafeAttribute $ Both (pure 
    { key: "side", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "side", value: prop' value })
instance Attr TextPath_ Side (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Side (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "side", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "side", value: prop' value })
instance Attr TextPath_ Side  String  where
  attr Side value = unsafeAttribute $ This $ pure $
    { key: "side", value: prop' value }
instance Attr TextPath_ Side (Event.Event  String ) where
  attr Side eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "side", value: prop' value }

instance Attr TextPath_ Side (ST.ST Global.Global  String ) where
  attr Side stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "side", value: prop' value }

instance Attr everything Side (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Side bothValues = unsafeAttribute $ Both (pure  { key: "side", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "side", value: unset' })
instance Attr everything Side (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Side (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "side", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "side", value: unset' })
instance Attr everything Side  Unit  where
  attr Side _ = unsafeAttribute $ This $ pure $ { key: "side", value: unset' }
instance Attr everything Side (Event.Event  Unit ) where
  attr Side eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "side", value: unset' }

instance Attr everything Side (ST.ST Global.Global  Unit ) where
  attr Side stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "side", value: unset' }
