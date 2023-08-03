module Deku.DOM.Attr.Rx where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rx = Rx

instance Attr Ellipse_ Rx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rx bothValues = unsafeAttribute $ Both (pure 
    { key: "rx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rx", value: prop' value })
instance Attr Ellipse_ Rx (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rx (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "rx", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rx", value: prop' value })
instance Attr Ellipse_ Rx  String  where
  attr Rx value = unsafeAttribute $ This $ pure $ { key: "rx", value: prop' value }
instance Attr Ellipse_ Rx (Event.Event  String ) where
  attr Rx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rx", value: prop' value }

instance Attr Ellipse_ Rx (ST.ST Global.Global  String ) where
  attr Rx stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "rx", value: prop' value }

instance Attr Rect_ Rx (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rx bothValues = unsafeAttribute $ Both (pure 
    { key: "rx", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "rx", value: prop' value })
instance Attr Rect_ Rx (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Rx (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "rx", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "rx", value: prop' value })
instance Attr Rect_ Rx  String  where
  attr Rx value = unsafeAttribute $ This $ pure $ { key: "rx", value: prop' value }
instance Attr Rect_ Rx (Event.Event  String ) where
  attr Rx eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rx", value: prop' value }

instance Attr Rect_ Rx (ST.ST Global.Global  String ) where
  attr Rx stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "rx", value: prop' value }

instance Attr everything Rx (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Rx bothValues = unsafeAttribute $ Both (pure  { key: "rx", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "rx", value: unset' })
instance Attr everything Rx (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Rx (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "rx", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "rx", value: unset' })
instance Attr everything Rx  Unit  where
  attr Rx _ = unsafeAttribute $ This $ pure $ { key: "rx", value: unset' }
instance Attr everything Rx (Event.Event  Unit ) where
  attr Rx eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rx", value: unset' }

instance Attr everything Rx (ST.ST Global.Global  Unit ) where
  attr Rx stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "rx", value: unset' }
