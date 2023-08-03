module Deku.DOM.Attr.Y2 where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Y2 = Y2

instance Attr Line_ Y2 (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y2 bothValues = unsafeAttribute $ Both (pure 
    { key: "y2", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "y2", value: prop' value })
instance Attr Line_ Y2 (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Y2 (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "y2", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "y2", value: prop' value })
instance Attr Line_ Y2  String  where
  attr Y2 value = unsafeAttribute $ This $ pure $ { key: "y2", value: prop' value }
instance Attr Line_ Y2 (Event.Event  String ) where
  attr Y2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y2", value: prop' value }

instance Attr Line_ Y2 (ST.ST Global.Global  String ) where
  attr Y2 stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "y2", value: prop' value }

instance Attr LinearGradient_ Y2 (NonEmpty.NonEmpty Event.Event  String ) where
  attr Y2 bothValues = unsafeAttribute $ Both (pure 
    { key: "y2", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "y2", value: prop' value })
instance Attr LinearGradient_ Y2 (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Y2 (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "y2", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "y2", value: prop' value })
instance Attr LinearGradient_ Y2  String  where
  attr Y2 value = unsafeAttribute $ This $ pure $ { key: "y2", value: prop' value }
instance Attr LinearGradient_ Y2 (Event.Event  String ) where
  attr Y2 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "y2", value: prop' value }

instance Attr LinearGradient_ Y2 (ST.ST Global.Global  String ) where
  attr Y2 stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "y2", value: prop' value }

instance Attr everything Y2 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Y2 bothValues = unsafeAttribute $ Both (pure  { key: "y2", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "y2", value: unset' })
instance Attr everything Y2 (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Y2 (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "y2", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "y2", value: unset' })
instance Attr everything Y2  Unit  where
  attr Y2 _ = unsafeAttribute $ This $ pure $ { key: "y2", value: unset' }
instance Attr everything Y2 (Event.Event  Unit ) where
  attr Y2 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "y2", value: unset' }

instance Attr everything Y2 (ST.ST Global.Global  Unit ) where
  attr Y2 stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "y2", value: unset' }
