module Deku.DOM.Attr.Background where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Background = Background

instance Attr Body_ Background (NonEmpty.NonEmpty Event.Event  String ) where
  attr Background bothValues = unsafeAttribute $ Both (pure 
    { key: "background", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Body_ Background (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Background (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "background", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Body_ Background  String  where
  attr Background value = unsafeAttribute $ This $ pure $
    { key: "background", value: prop' value }
instance Attr Body_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr Body_ Background (ST.ST Global.Global  String ) where
  attr Background iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "background", value: prop' value }

instance Attr Table_ Background (NonEmpty.NonEmpty Event.Event  String ) where
  attr Background bothValues = unsafeAttribute $ Both (pure 
    { key: "background", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Table_ Background (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Background (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "background", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Table_ Background  String  where
  attr Background value = unsafeAttribute $ This $ pure $
    { key: "background", value: prop' value }
instance Attr Table_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr Table_ Background (ST.ST Global.Global  String ) where
  attr Background iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "background", value: prop' value }

instance Attr Td_ Background (NonEmpty.NonEmpty Event.Event  String ) where
  attr Background bothValues = unsafeAttribute $ Both (pure 
    { key: "background", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Td_ Background (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Background (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "background", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Td_ Background  String  where
  attr Background value = unsafeAttribute $ This $ pure $
    { key: "background", value: prop' value }
instance Attr Td_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr Td_ Background (ST.ST Global.Global  String ) where
  attr Background iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "background", value: prop' value }

instance Attr Th_ Background (NonEmpty.NonEmpty Event.Event  String ) where
  attr Background bothValues = unsafeAttribute $ Both (pure 
    { key: "background", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Th_ Background (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Background (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "background", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Th_ Background  String  where
  attr Background value = unsafeAttribute $ This $ pure $
    { key: "background", value: prop' value }
instance Attr Th_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr Th_ Background (ST.ST Global.Global  String ) where
  attr Background iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "background", value: prop' value }

instance Attr everything Background (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Background bothValues = unsafeAttribute $ Both (pure 
    { key: "background", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "background", value: unset' })
instance Attr everything Background (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Background (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "background", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "background", value: unset' })
instance Attr everything Background  Unit  where
  attr Background _ = unsafeAttribute $ This $ pure $
    { key: "background", value: unset' }
instance Attr everything Background (Event.Event  Unit ) where
  attr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "background", value: unset' }

instance Attr everything Background (ST.ST Global.Global  Unit ) where
  attr Background iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "background", value: unset' }
