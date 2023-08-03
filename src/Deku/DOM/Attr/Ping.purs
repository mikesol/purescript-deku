module Deku.DOM.Attr.Ping where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ping = Ping

instance Attr A_ Ping (NonEmpty.NonEmpty Event.Event  String ) where
  attr Ping bothValues = unsafeAttribute $ Both (pure 
    { key: "ping", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "ping", value: prop' value })
instance Attr A_ Ping (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Ping (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "ping", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "ping", value: prop' value })
instance Attr A_ Ping  String  where
  attr Ping value = unsafeAttribute $ This $ pure $
    { key: "ping", value: prop' value }
instance Attr A_ Ping (Event.Event  String ) where
  attr Ping eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "ping", value: prop' value }

instance Attr A_ Ping (ST.ST Global.Global  String ) where
  attr Ping stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "ping", value: prop' value }

instance Attr Area_ Ping (NonEmpty.NonEmpty Event.Event  String ) where
  attr Ping bothValues = unsafeAttribute $ Both (pure 
    { key: "ping", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "ping", value: prop' value })
instance Attr Area_ Ping (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Ping (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "ping", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "ping", value: prop' value })
instance Attr Area_ Ping  String  where
  attr Ping value = unsafeAttribute $ This $ pure $
    { key: "ping", value: prop' value }
instance Attr Area_ Ping (Event.Event  String ) where
  attr Ping eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "ping", value: prop' value }

instance Attr Area_ Ping (ST.ST Global.Global  String ) where
  attr Ping stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "ping", value: prop' value }

instance Attr everything Ping (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Ping bothValues = unsafeAttribute $ Both (pure  { key: "ping", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "ping", value: unset' })
instance Attr everything Ping (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Ping (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "ping", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "ping", value: unset' })
instance Attr everything Ping  Unit  where
  attr Ping _ = unsafeAttribute $ This $ pure $ { key: "ping", value: unset' }
instance Attr everything Ping (Event.Event  Unit ) where
  attr Ping eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "ping", value: unset' }

instance Attr everything Ping (ST.ST Global.Global  Unit ) where
  attr Ping stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "ping", value: unset' }
