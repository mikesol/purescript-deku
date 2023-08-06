module Deku.DOM.Attr.Rel where

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
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rel = Rel

instance Attr A_ Rel (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rel bothValues = unsafeAttribute $ Both (pure 
    { key: "rel", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rel", value: prop' value })
instance Attr A_ Rel (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "rel", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rel", value: prop' value })
instance Attr A_ Rel  String  where
  attr Rel value = unsafeAttribute $ This $ { key: "rel", value: prop' value }
instance Attr A_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rel", value: prop' value }

instance Attr A_ Rel (ST.ST Global.Global  String ) where
  attr Rel iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "rel", value: prop' value }

instance Attr Area_ Rel (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rel bothValues = unsafeAttribute $ Both (pure 
    { key: "rel", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rel", value: prop' value })
instance Attr Area_ Rel (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "rel", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rel", value: prop' value })
instance Attr Area_ Rel  String  where
  attr Rel value = unsafeAttribute $ This $ { key: "rel", value: prop' value }
instance Attr Area_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rel", value: prop' value }

instance Attr Area_ Rel (ST.ST Global.Global  String ) where
  attr Rel iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "rel", value: prop' value }

instance Attr Link_ Rel (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rel bothValues = unsafeAttribute $ Both (pure 
    { key: "rel", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rel", value: prop' value })
instance Attr Link_ Rel (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "rel", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rel", value: prop' value })
instance Attr Link_ Rel  String  where
  attr Rel value = unsafeAttribute $ This $ { key: "rel", value: prop' value }
instance Attr Link_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rel", value: prop' value }

instance Attr Link_ Rel (ST.ST Global.Global  String ) where
  attr Rel iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "rel", value: prop' value }

instance Attr everything Rel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Rel bothValues = unsafeAttribute $ Both (pure  { key: "rel", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "rel", value: unset' })
instance Attr everything Rel (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Rel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "rel", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "rel", value: unset' })
instance Attr everything Rel  Unit  where
  attr Rel _ = unsafeAttribute $ This $ { key: "rel", value: unset' }
instance Attr everything Rel (Event.Event  Unit ) where
  attr Rel eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rel", value: unset' }

instance Attr everything Rel (ST.ST Global.Global  Unit ) where
  attr Rel iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "rel", value: unset' }
