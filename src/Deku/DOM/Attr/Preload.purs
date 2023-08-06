module Deku.DOM.Attr.Preload where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Preload = Preload

instance Attr Audio_ Preload (NonEmpty.NonEmpty Event.Event  String ) where
  attr Preload bothValues = unsafeAttribute $ Both (pure 
    { key: "preload", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "preload", value: prop' value })
instance Attr Audio_ Preload (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Preload (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "preload", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "preload", value: prop' value })
instance Attr Audio_ Preload  String  where
  attr Preload value = unsafeAttribute $ This $ pure $
    { key: "preload", value: prop' value }
instance Attr Audio_ Preload (Event.Event  String ) where
  attr Preload eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "preload", value: prop' value }

instance Attr Audio_ Preload (ST.ST Global.Global  String ) where
  attr Preload iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "preload", value: prop' value }

instance Attr Video_ Preload (NonEmpty.NonEmpty Event.Event  String ) where
  attr Preload bothValues = unsafeAttribute $ Both (pure 
    { key: "preload", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "preload", value: prop' value })
instance Attr Video_ Preload (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Preload (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "preload", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "preload", value: prop' value })
instance Attr Video_ Preload  String  where
  attr Preload value = unsafeAttribute $ This $ pure $
    { key: "preload", value: prop' value }
instance Attr Video_ Preload (Event.Event  String ) where
  attr Preload eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "preload", value: prop' value }

instance Attr Video_ Preload (ST.ST Global.Global  String ) where
  attr Preload iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "preload", value: prop' value }

instance Attr everything Preload (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Preload bothValues = unsafeAttribute $ Both (pure 
    { key: "preload", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "preload", value: unset' })
instance Attr everything Preload (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Preload (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "preload", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "preload", value: unset' })
instance Attr everything Preload  Unit  where
  attr Preload _ = unsafeAttribute $ This $ { key: "preload", value: unset' }
instance Attr everything Preload (Event.Event  Unit ) where
  attr Preload eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "preload", value: unset' }

instance Attr everything Preload (ST.ST Global.Global  Unit ) where
  attr Preload iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "preload", value: unset' }
