module Deku.DOM.Attr.Rows where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rows = Rows

instance Attr Textarea_ Rows (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rows bothValues = unsafeAttribute $ Both (pure 
    { key: "rows", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rows", value: prop' value })
instance Attr Textarea_ Rows (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rows (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "rows", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rows", value: prop' value })
instance Attr Textarea_ Rows  String  where
  attr Rows value = unsafeAttribute $ This $ pure $
    { key: "rows", value: prop' value }
instance Attr Textarea_ Rows (Event.Event  String ) where
  attr Rows eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rows", value: prop' value }

instance Attr Textarea_ Rows (ST.ST Global.Global  String ) where
  attr Rows stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "rows", value: prop' value }

instance Attr everything Rows (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Rows bothValues = unsafeAttribute $ Both (pure  { key: "rows", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "rows", value: unset' })
instance Attr everything Rows (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Rows (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "rows", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "rows", value: unset' })
instance Attr everything Rows  Unit  where
  attr Rows _ = unsafeAttribute $ This $ pure $ { key: "rows", value: unset' }
instance Attr everything Rows (Event.Event  Unit ) where
  attr Rows eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rows", value: unset' }

instance Attr everything Rows (ST.ST Global.Global  Unit ) where
  attr Rows stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "rows", value: unset' }
