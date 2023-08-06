module Deku.DOM.Attr.OnSelect where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSelect = OnSelect

instance Attr anything OnSelect (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSelect bothValues = unsafeAttribute $ Both (pure 
    { key: "select", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "select", value: cb' value })
instance Attr anything OnSelect (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnSelect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "select", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "select", value: cb' value })
instance Attr anything OnSelect  Cb  where
  attr OnSelect value = unsafeAttribute $ This $ pure $
    { key: "select", value: cb' value }
instance Attr anything OnSelect (Event.Event  Cb ) where
  attr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "select", value: cb' value }

instance Attr anything OnSelect (ST.ST Global.Global  Cb ) where
  attr OnSelect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "select", value: cb' value }

instance Attr anything OnSelect (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSelect bothValues = unsafeAttribute $ Both (pure 
    { key: "select", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "select", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSelect (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnSelect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "select", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "select", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSelect  (Effect Unit)  where
  attr OnSelect value = unsafeAttribute $ This $ pure $
    { key: "select", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelect (Event.Event  (Effect Unit) ) where
  attr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "select", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelect (ST.ST Global.Global  (Effect Unit) ) where
  attr OnSelect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "select", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelect (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSelect bothValues = unsafeAttribute $ Both (pure 
    { key: "select", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "select", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSelect (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnSelect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "select", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "select", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSelect  (Effect Boolean)  where
  attr OnSelect value = unsafeAttribute $ This $ pure $
    { key: "select", value: cb' (Cb (const value)) }
instance Attr anything OnSelect (Event.Event  (Effect Boolean) ) where
  attr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "select", value: cb' (Cb (const value)) }

instance Attr anything OnSelect (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnSelect iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "select", value: cb' (Cb (const value)) }

instance Attr everything OnSelect (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSelect bothValues = unsafeAttribute $ Both (pure 
    { key: "select", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "select", value: unset' })
instance Attr everything OnSelect (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnSelect (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "select", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "select", value: unset' })
instance Attr everything OnSelect  Unit  where
  attr OnSelect _ = unsafeAttribute $ This $ { key: "select", value: unset' }
instance Attr everything OnSelect (Event.Event  Unit ) where
  attr OnSelect eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "select", value: unset' }

instance Attr everything OnSelect (ST.ST Global.Global  Unit ) where
  attr OnSelect iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "select", value: unset' }
