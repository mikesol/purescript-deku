module Deku.DOM.Attr.HttpEquiv where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data HttpEquiv = HttpEquiv

instance Attr Meta_ HttpEquiv (NonEmpty.NonEmpty Event.Event  String ) where
  attr HttpEquiv bothValues = unsafeAttribute $ Both (pure 
    { key: "http-equiv", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "http-equiv", value: prop' value })
instance Attr Meta_ HttpEquiv (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr HttpEquiv (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "http-equiv", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "http-equiv", value: prop' value })
instance Attr Meta_ HttpEquiv  String  where
  attr HttpEquiv value = unsafeAttribute $ This $ pure $
    { key: "http-equiv", value: prop' value }
instance Attr Meta_ HttpEquiv (Event.Event  String ) where
  attr HttpEquiv eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "http-equiv", value: prop' value }

instance Attr Meta_ HttpEquiv (ST.ST Global.Global  String ) where
  attr HttpEquiv iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "http-equiv", value: prop' value }

instance Attr everything HttpEquiv (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr HttpEquiv bothValues = unsafeAttribute $ Both (pure 
    { key: "http-equiv", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "http-equiv", value: unset' })
instance Attr everything HttpEquiv (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr HttpEquiv (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "http-equiv", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "http-equiv", value: unset' })
instance Attr everything HttpEquiv  Unit  where
  attr HttpEquiv _ = unsafeAttribute $ This $ pure $
    { key: "http-equiv", value: unset' }
instance Attr everything HttpEquiv (Event.Event  Unit ) where
  attr HttpEquiv eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "http-equiv", value: unset' }

instance Attr everything HttpEquiv (ST.ST Global.Global  Unit ) where
  attr HttpEquiv iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "http-equiv", value: unset' }
