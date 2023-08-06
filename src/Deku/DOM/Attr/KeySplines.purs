module Deku.DOM.Attr.KeySplines where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeySplines = KeySplines

instance Attr Animate_ KeySplines (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeySplines bothValues = unsafeAttribute $ Both (pure 
    { key: "keySplines", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keySplines", value: prop' value })
instance Attr Animate_ KeySplines (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KeySplines (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "keySplines", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keySplines", value: prop' value })
instance Attr Animate_ KeySplines  String  where
  attr KeySplines value = unsafeAttribute $ This $ pure $
    { key: "keySplines", value: prop' value }
instance Attr Animate_ KeySplines (Event.Event  String ) where
  attr KeySplines eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keySplines", value: prop' value }

instance Attr Animate_ KeySplines (ST.ST Global.Global  String ) where
  attr KeySplines iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "keySplines", value: prop' value }

instance Attr AnimateMotion_ KeySplines (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeySplines bothValues = unsafeAttribute $ Both (pure 
    { key: "keySplines", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keySplines", value: prop' value })
instance Attr AnimateMotion_ KeySplines (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KeySplines (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "keySplines", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keySplines", value: prop' value })
instance Attr AnimateMotion_ KeySplines  String  where
  attr KeySplines value = unsafeAttribute $ This $ pure $
    { key: "keySplines", value: prop' value }
instance Attr AnimateMotion_ KeySplines (Event.Event  String ) where
  attr KeySplines eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keySplines", value: prop' value }

instance Attr AnimateMotion_ KeySplines (ST.ST Global.Global  String ) where
  attr KeySplines iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "keySplines", value: prop' value }

instance Attr AnimateTransform_ KeySplines (NonEmpty.NonEmpty Event.Event  String ) where
  attr KeySplines bothValues = unsafeAttribute $ Both (pure 
    { key: "keySplines", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "keySplines", value: prop' value })
instance Attr AnimateTransform_ KeySplines (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr KeySplines (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "keySplines", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "keySplines", value: prop' value })
instance Attr AnimateTransform_ KeySplines  String  where
  attr KeySplines value = unsafeAttribute $ This $ pure $
    { key: "keySplines", value: prop' value }
instance Attr AnimateTransform_ KeySplines (Event.Event  String ) where
  attr KeySplines eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keySplines", value: prop' value }

instance Attr AnimateTransform_ KeySplines (ST.ST Global.Global  String ) where
  attr KeySplines iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "keySplines", value: prop' value }

instance Attr everything KeySplines (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr KeySplines bothValues = unsafeAttribute $ Both (pure 
    { key: "keySplines", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "keySplines", value: unset' })
instance Attr everything KeySplines (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr KeySplines (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "keySplines", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "keySplines", value: unset' })
instance Attr everything KeySplines  Unit  where
  attr KeySplines _ = unsafeAttribute $ This $ pure $
    { key: "keySplines", value: unset' }
instance Attr everything KeySplines (Event.Event  Unit ) where
  attr KeySplines eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "keySplines", value: unset' }

instance Attr everything KeySplines (ST.ST Global.Global  Unit ) where
  attr KeySplines iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "keySplines", value: unset' }
