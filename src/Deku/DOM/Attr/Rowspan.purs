module Deku.DOM.Attr.Rowspan where

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

data Rowspan = Rowspan

instance Attr Td_ Rowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rowspan", value: prop' value })
instance Attr Td_ Rowspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rowspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "rowspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rowspan", value: prop' value })
instance Attr Td_ Rowspan  String  where
  attr Rowspan value = unsafeAttribute $ This $ pure $
    { key: "rowspan", value: prop' value }
instance Attr Td_ Rowspan (Event.Event  String ) where
  attr Rowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "rowspan", value: prop' value }

instance Attr Td_ Rowspan (ST.ST Global.Global  String ) where
  attr Rowspan stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "rowspan", value: prop' value }

instance Attr Th_ Rowspan (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "rowspan", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rowspan", value: prop' value })
instance Attr Th_ Rowspan (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rowspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "rowspan", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rowspan", value: prop' value })
instance Attr Th_ Rowspan  String  where
  attr Rowspan value = unsafeAttribute $ This $ pure $
    { key: "rowspan", value: prop' value }
instance Attr Th_ Rowspan (Event.Event  String ) where
  attr Rowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "rowspan", value: prop' value }

instance Attr Th_ Rowspan (ST.ST Global.Global  String ) where
  attr Rowspan stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "rowspan", value: prop' value }

instance Attr everything Rowspan (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Rowspan bothValues = unsafeAttribute $ Both (pure 
    { key: "rowspan", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "rowspan", value: unset' })
instance Attr everything Rowspan (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Rowspan (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "rowspan", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "rowspan", value: unset' })
instance Attr everything Rowspan  Unit  where
  attr Rowspan _ = unsafeAttribute $ This $ pure $ { key: "rowspan", value: unset' }
instance Attr everything Rowspan (Event.Event  Unit ) where
  attr Rowspan eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rowspan", value: unset' }

instance Attr everything Rowspan (ST.ST Global.Global  Unit ) where
  attr Rowspan stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "rowspan", value: unset' }
