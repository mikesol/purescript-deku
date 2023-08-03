module Deku.DOM.Attr.Ry where

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

data Ry = Ry

instance Attr Ellipse_ Ry (NonEmpty.NonEmpty Event.Event  String ) where
  attr Ry bothValues = unsafeAttribute $ Both (pure 
    { key: "ry", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "ry", value: prop' value })
instance Attr Ellipse_ Ry (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Ry (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "ry", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "ry", value: prop' value })
instance Attr Ellipse_ Ry  String  where
  attr Ry value = unsafeAttribute $ This $ pure $ { key: "ry", value: prop' value }
instance Attr Ellipse_ Ry (Event.Event  String ) where
  attr Ry eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "ry", value: prop' value }

instance Attr Ellipse_ Ry (ST.ST Global.Global  String ) where
  attr Ry stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "ry", value: prop' value }

instance Attr Rect_ Ry (NonEmpty.NonEmpty Event.Event  String ) where
  attr Ry bothValues = unsafeAttribute $ Both (pure 
    { key: "ry", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "ry", value: prop' value })
instance Attr Rect_ Ry (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Ry (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "ry", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "ry", value: prop' value })
instance Attr Rect_ Ry  String  where
  attr Ry value = unsafeAttribute $ This $ pure $ { key: "ry", value: prop' value }
instance Attr Rect_ Ry (Event.Event  String ) where
  attr Ry eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "ry", value: prop' value }

instance Attr Rect_ Ry (ST.ST Global.Global  String ) where
  attr Ry stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "ry", value: prop' value }

instance Attr everything Ry (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Ry bothValues = unsafeAttribute $ Both (pure  { key: "ry", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "ry", value: unset' })
instance Attr everything Ry (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Ry (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "ry", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "ry", value: unset' })
instance Attr everything Ry  Unit  where
  attr Ry _ = unsafeAttribute $ This $ pure $ { key: "ry", value: unset' }
instance Attr everything Ry (Event.Event  Unit ) where
  attr Ry eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "ry", value: unset' }

instance Attr everything Ry (ST.ST Global.Global  Unit ) where
  attr Ry stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "ry", value: unset' }
