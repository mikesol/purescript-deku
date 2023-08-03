module Deku.DOM.Attr.Colspan where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Colspan = Colspan

instance Attr Td_ Colspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr Colspan bothValues = unsafeAttribute $ Both (pure 
    { key: "colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "colspan", value: prop' value })
instance Attr Td_ Colspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Colspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "colspan", value: prop' value })
instance Attr Td_ Colspan  String  where
  attr Colspan value = unsafeAttribute $ This $ pure $
    { key: "colspan", value: prop' value }
instance Attr Td_ Colspan (Event.Event  String ) where
  attr Colspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "colspan", value: prop' value }

instance Attr Td_ Colspan (ST.ST Global.Global  String ) where
  attr Colspan stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "colspan", value: prop' value }

instance Attr Th_ Colspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr Colspan bothValues = unsafeAttribute $ Both (pure 
    { key: "colspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "colspan", value: prop' value })
instance Attr Th_ Colspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Colspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "colspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "colspan", value: prop' value })
instance Attr Th_ Colspan  String  where
  attr Colspan value = unsafeAttribute $ This $ pure $
    { key: "colspan", value: prop' value }
instance Attr Th_ Colspan (Event.Event  String ) where
  attr Colspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "colspan", value: prop' value }

instance Attr Th_ Colspan (ST.ST Global.Global  String ) where
  attr Colspan stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "colspan", value: prop' value }

instance Attr everything Colspan (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Colspan bothValues = unsafeAttribute $ Both (pure 
    { key: "colspan", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "colspan", value: unset' })
instance Attr everything Colspan (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Colspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "colspan", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "colspan", value: unset' })
instance Attr everything Colspan  Unit  where
  attr Colspan _ = unsafeAttribute $ This $ pure $ { key: "colspan", value: unset' }
instance Attr everything Colspan (Event.Event  Unit ) where
  attr Colspan eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "colspan", value: unset' }

instance Attr everything Colspan (ST.ST Global.Global  Unit ) where
  attr Colspan stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "colspan", value: unset' }
