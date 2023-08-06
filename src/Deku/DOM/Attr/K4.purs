module Deku.DOM.Attr.K4 where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K4 = K4

instance Attr FeComposite_ K4 (NonEmpty.NonEmpty Event.Event  String ) where
  attr K4 bothValues = unsafeAttribute $ Both (pure 
    { key: "k4", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "k4", value: prop' value })
instance Attr FeComposite_ K4 (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr K4 (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "k4", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "k4", value: prop' value })
instance Attr FeComposite_ K4  String  where
  attr K4 value = unsafeAttribute $ This $ { key: "k4", value: prop' value }
instance Attr FeComposite_ K4 (Event.Event  String ) where
  attr K4 eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "k4", value: prop' value }

instance Attr FeComposite_ K4 (ST.ST Global.Global  String ) where
  attr K4 iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "k4", value: prop' value }

instance Attr everything K4 (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr K4 bothValues = unsafeAttribute $ Both (pure  { key: "k4", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "k4", value: unset' })
instance Attr everything K4 (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr K4 (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "k4", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "k4", value: unset' })
instance Attr everything K4  Unit  where
  attr K4 _ = unsafeAttribute $ This $ { key: "k4", value: unset' }
instance Attr everything K4 (Event.Event  Unit ) where
  attr K4 eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "k4", value: unset' }

instance Attr everything K4 (ST.ST Global.Global  Unit ) where
  attr K4 iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "k4", value: unset' }
